pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Acceptable is Ownable {
    address sender;

    modifier onlyAcceptable {
        require(msg.sender == sender);
        _;
    }

    function setAcceptable(address _sender) public onlyOwner {
        sender = _sender;
    }
}

contract AtomicProcessFrontend {
    AtomicProcessBackendA backendA;
    AtomicProcessBackendB backendB;

    function AtomicProcessFrontend(
        AtomicProcessBackendA _backendA,
        AtomicProcessBackendB _backendB
    ) public {
        backendA = _backendA;
        backendB = _backendB;
    }

    function useAB() public {
        backendA.A();
        backendB.B();
    }
}

contract AtomicProcessBackendA is Acceptable {
    function A() public onlyAcceptable {
        // some code
    }
}

contract AtomicProcessBackendB is Acceptable {
    function B() public onlyAcceptable {
        // some code
    }
}
