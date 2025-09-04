// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Constant {
    uint256 public constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "0xAA";
    bytes constant CONSTANT_BYTES = "WTF";
    address constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;

    uint256 public immutable IMMUTABLE_NUM = 9999;
    address public immutable IMMUTABLE_ADDRESS; 
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public IMMUTABLE_TEST;

    constructor() {
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_NUM = 23334;
        IMMUTABLE_BLOCK = block.number;
        IMMUTABLE_TEST = test();
    }

    function test() public pure returns(uint256) {
        uint256 what = 9;
        // CONSTANT_NUM = 12;
        return (what);
    }
}