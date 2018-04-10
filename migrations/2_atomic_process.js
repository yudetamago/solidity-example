var Migrations = artifacts.require("./Migrations.sol");

var BackendA = artifacts.require("AtomicProcessBackendA");
var BackendB = artifacts.require("AtomicProcessBackendB");
var Frontend = artifacts.require("AtomicProcessFrontend");


module.exports = function(deployer) {

  deployer.then(async () => {
      await deployer.deploy(BackendA);
      await deployer.deploy(BackendB);
      await deployer.deploy(Frontend, BackendA.address, BackendB.address);
      const deployedA = await BackendA.deployed();
      const deployedB = await BackendB.deployed();
      await deployedA.setAcceptable(Frontend.address);
      return deployedB.setAcceptable(Frontend.address);
  });
};
