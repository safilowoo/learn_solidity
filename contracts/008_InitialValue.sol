// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract InitialValue {
    bool public _bool;
    string public _string;
    int public _int;
    uint public _uint;
    address public _address;

    enum ActionSet {Buy, Hold, Sell}
    ActionSet public _enum;

    function fi() internal {}
    function fe() external {}

    uint[9] public _staticArray;
    uint[] public _dynamicArray;
    mapping(uint => address) public _mapping;
    struct Student {
        uint256 id;
        uint256 score;
    }
    Student public student;

    bool public _bool2 = true;
    string public _string2 = '32432';
    int public _int2 = 3433;
    uint public _uint2 = 324324;
    address public _address2 = 0x0000000000000000000000000000000000000009;
    uint[3] public _staticArray2 = [1, 2, 3];
    uint[] public _dynamicArray2;
    // _dynamicArray2[1] = 123;
    // _dynamicArray2[1] = 34;
    function deleteFn() external {
        delete _bool2;
        delete _string2;
        delete _int2;
        delete _uint2;
        delete _address2;
        delete _staticArray2;
        delete _dynamicArray2;
        // delete _mapping[333];
        delete student;
    }
}