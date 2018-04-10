pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract OwnableContract is Ownable {
    function onlyOwnerFunction() public view onlyOwner {
        // only owner reaches this line
    }
}
