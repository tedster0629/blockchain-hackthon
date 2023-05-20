pragma solidity ^0.4.6;

contract SellerPlatform {
     enum ProductStatus { Register, Sold, Deliver, Done }
    //Ref : https://coursetro.com/posts/code/102/Solidity-Mappings-&-Structs-Tutorial
    struct Product {
        string Name;
        uint Id;
        ProductStatus Status;
        uint Quantity;
        uint256 Timestamp;
        Buyer BuyerInfo;
        uint PrevBlock;
        uint CurrentBlock;
    }

    struct Buyer {
        address Address;
    }
    
    // Maintain product block history 
    mapping(uint => Product) ProductReg;
    uint8 ProductRegCount=0;
    event ProductRegEvent(address indexed _from, string  name, uint id, uint256 Timestamp);
    event AnonymousDeposit(address indexed from, uint value);


    // sold product
     mapping(uint => Product) ProductSold;
     uint8 ProductSoldCount=0;
     event ProductSoldEvent(address indexed _from, string  name, uint id, uint256 Timestamp, address buyer );

    // delibver product
     mapping(uint => Product) ProductDelivered;
     uint8 ProductDeliverCount=0;
     event ProductDeliveredEvent(address indexed _from, bytes32 indexed _id, uint _value);


    function RegisterProduct(string Name, uint Quantity)  returns(string, uint, uint , uint, uint) {
        Product memory newProduct;
        newProduct.Name = Name;
        newProduct.Quantity = Quantity;
        newProduct.Status = ProductStatus.Register;
        newProduct.Id = ProductRegCount;
        newProduct.Timestamp = block.timestamp;
        newProduct.PrevBlock = block.number;
        newProduct.CurrentBlock = block.number;
        ProductReg[newProduct.Id] = newProduct;    
        ProductRegCount++;
        AnonymousDeposit(msg.sender,block.number);
        ProductRegEvent(msg.sender, newProduct.Name, newProduct.Id, newProduct.Timestamp);
        return (newProduct.Name,newProduct.Id,uint(newProduct.Status) ,block.number,ProductRegCount);
    }

    // registration of product
    function sellProduct(uint ProductId)  returns(string, uint, uint , uint, uint) {
        var sellProduct = ProductReg[ProductId];
        sellProduct.Status = ProductStatus.Sold;
        sellProduct.BuyerInfo.Address = msg.sender;
        sellProduct.PrevBlock = sellProduct.CurrentBlock;
        sellProduct.CurrentBlock = block.number;
        sellProduct.Timestamp = block.timestamp;
        ProductSold[ProductSoldCount] = sellProduct;
        ProductSoldEvent(msg.sender, sellProduct.Name, sellProduct.Id, sellProduct.Timestamp,msg.sender);
        ProductSoldCount++;
        return (sellProduct.Name,sellProduct.Id,uint(sellProduct.Status), block.number,ProductSoldCount);

    }

    function DeliverProduct(uint ProductId) returns(string, uint, uint , uint, uint) {
        var delProduct = ProductReg[ProductId];
        delProduct.Status = ProductStatus.Deliver;
        ProductDelivered[ProductDeliverCount] = delProduct;
        ProductDeliverCount++;
        return (delProduct.Name,delProduct.Id,uint(delProduct.Status), block.number,ProductDeliverCount);
    }

    function GetRegProductCount() constant returns(uint) {
        return ProductRegCount;
        
    }

    function GetSoldProductCount() constant returns(uint) {
        return ProductSoldCount;
        
    }

    function GetDeliveredProductCount()  constant returns(uint) {
        return ProductDeliverCount;
        
    }
    function GetProduct(uint ProductId) constant returns (string) {
        return ProductReg[ProductId].Name;
    }
}