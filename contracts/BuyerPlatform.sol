pragma solidity ^0.4.6;

contract BuyerPlatform {
    
    //Ref : https://coursetro.com/posts/code/102/Solidity-Mappings-&-Structs-Tutorial
    struct Product {
        string Name;
        uint Id;
        string Status;
        uint Quantity;
        uint256 Timestamp;
    }
    
    // Maintain product block history 
    mapping(uint => Product) ProductBrought;
    uint8 ProductBroughtCount=0;


    // Bought product
     mapping(uint => Product) ProductShipped;
     uint8 ProductShippedCount=0;

    // delivered product
     mapping(uint => Product) ProductDelivered;
     uint8 ProductDeliverCount=0;
   

   //ORDER PLACING
    function BuyProduct(string Name, uint Quantity)  returns(string, uint, string , uint, uint) {
        Product memory newProduct;
        newProduct.Name = Name;
        newProduct.Quantity = Quantity;
        newProduct.Status = "ORDERPLACED";
        newProduct.Id = ProductBroughtCount;
        newProduct.Timestamp = block.timestamp;
        ProductBrought[newProduct.Id] = newProduct;    
        ProductBroughtCount++;
        return (newProduct.Name,newProduct.Id,newProduct.Status, block.number,ProductBroughtCount);
    }

    // SHIPPING OF PRODUCT
    function shipProduct(uint ProductId)  returns(string, uint, string , uint, uint) {
        var newProduct = ProductBrought[ProductId];
        newProduct.Status = "ORDERSHIPPED";
        ProductShipped[ProductShippedCount] = newProduct;
        ProductShippedCount++;
        return (newProduct.Name,newProduct.Id,newProduct.Status, block.number,ProductShippedCount);

    }
    //DELIVERY OF PRODUCT
    function DeliverProduct(uint ProductId) returns(string, uint, string , uint, uint) {
        var newProduct = ProductBrought[ProductId];
        newProduct.Status = "DELIVERED";
        ProductDelivered[ProductDeliverCount] = newProduct;
        ProductDeliverCount++;
        return (newProduct.Name,newProduct.Id,newProduct.Status, block.number,ProductDeliverCount);
    
    }

    function GetBroughtProductCount() constant returns(uint) {
        return ProductBroughtCount;
        
    }

    function GetShippedProductCount() constant returns(uint) {
        return ProductShippedCount;
        
    }

    function GetDeliveredProductCount()  constant returns(uint) {
        return ProductDeliverCount;
        
    }
    function GetProduct(uint ProductId) constant returns (string) {
        return ProductBrought[ProductId].Name;
    }
}