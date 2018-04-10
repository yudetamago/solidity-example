pragma solidity ^0.4.19;

contract OneObjectContract {
    struct Object {
        uint256 number;
    }
    Object object_on_storage;
    function write() public {
        Object memory object_on_memory;
        // on memory
        object_on_memory = Object({number: 10});
        // write to blockchain
        object_on_storage = Object({number: 10});
    }
}
