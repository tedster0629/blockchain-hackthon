var FoodSafe = artifacts.require("./FoodSafe.sol");
var SellerPlatform = artifacts.require("./SellerPlatform.sol");
var BuyerPlatform = artifacts.require("./BuyerPlatform.sol");


module.exports = function(deployer) {
  deployer.deploy(FoodSafe);
  deployer.deploy(SellerPlatform);
  deployer.deploy(BuyerPlatform);
};
