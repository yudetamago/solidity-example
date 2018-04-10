pragma solidity ^0.4.19;

contract AlwaysRevert {
    function alwaysRevertFunction() public view {
        require(msg.sender == address(0));

        // no one can reach this line
    }
}
