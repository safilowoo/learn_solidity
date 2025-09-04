// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ValueType {
    // bool
    bool public _bool = true;
    bool public _bool1 = !_bool;
    bool public _bool2 = _bool && _bool1;
    bool public _bool3 = _bool || _bool1;
    bool public _bool4 = _bool == _bool1;
    bool public _bool5 = _bool != _bool1;

    // int
    int public _int = -1;
    uint public _uint = 1;
    uint256 public _number = 20250901;
    
    // int operations
    uint256 public _number1 = _number + 1;
    uint256 public _number2 = 2**2;
    uint256 public _number3 = 7 % 2;
    bool public _numberbool = _number2 > _number3;
}