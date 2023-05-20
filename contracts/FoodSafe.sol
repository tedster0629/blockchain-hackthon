pragma solidity ^0.4.19;

contract FoodSafe {

    struct Location {
        string Name;
        uint LocationId;
        uint PrevLocaltionId;
        uint Timestamp;
        string Secret;
    }
    
    mapping(uint => Location) Trail;

    
    uint8 TrailCount = 0;

    
    function addNewLocaltion(uint LocationId, string Name, string Secret ) {

        
        Location memory newLocation; 

        newLocation.LocationId = LocationId;
        newLocation.Name = Name;
        newLocation.Secret = Secret;
        newLocation.Timestamp = now;

        
        if (TrailCount != 0 ) {

            newLocation.PrevLocaltionId = Trail[TrailCount].LocationId;
        }

        Trail[TrailCount] = newLocation;

        TrailCount++;
        
    }

    
    function currentTrailCount() returns (uint8) {
        return TrailCount;
        
    }

    

    function getLocation(uint8 TrailNo) returns(string, uint, uint, uint, string) {
        var TrailNoLocation = Trail[TrailNo];
        return (TrailNoLocation.Name, TrailNoLocation.LocationId, TrailNoLocation.PrevLocaltionId, TrailNoLocation.Timestamp
        , TrailNoLocation.Secret);
        
    }




}