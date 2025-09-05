// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract C {
    uint public num;
    address public  Sender;

    function setVars(uint _num) public payable {
        num = _num;
        Sender = msg.sender;
    }
}

contract B {
    uint public num;
    address public Sender;

    function callSetVars(address _addr, uint _num) external payable {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        
    }

    function delegatecallSetvars(address _addr, uint _num) external payable {
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        
    }
}