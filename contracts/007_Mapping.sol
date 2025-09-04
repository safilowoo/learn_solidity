// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Mapping {
    mapping(uint => address) public idToAddress;
    mapping(address => address) public swapPair;

    // error mapping只支持基本类型
    // struct Student {
    //     uint256 id;
    //     uint256 score;
    // }
    // mapping(Student => uint) public testVar;

    function writeMap(uint _Key, address _Value) public {
        idToAddress[_Key] = _Value;
    }
}