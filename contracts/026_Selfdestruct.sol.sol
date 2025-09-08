// SPDX-License-Identifier: GPL-3.0

// pragma solidity ^0.8.4;

pragma solidity >=0.8.7 <0.9.0;

contract DeleteContract {
    uint public value = 10;
    uint public num = 0;
    constructor() payable {}
    receive() external payable {}

    function deleteContract() external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns(uint balance) {
        balance = address(this).balance;
    }

    function setNum(uint256 _num) external {
        num = _num;
    }
}


contract DeployContract {

    struct DemoResult {
        address addr;
        uint balance;
        uint value;
    }

    constructor() payable {}

    function getBalance() external view returns(uint balance){
        balance = address(this).balance;
    }

    function demo() public payable returns (DemoResult memory){
        DeleteContract del = new DeleteContract{value:msg.value}();
        DemoResult memory res = DemoResult({
            addr: address(del),
            balance: del.getBalance(),
            value: del.value()
        });
        del.deleteContract();
        return res;
    }
}