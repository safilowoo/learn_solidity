// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

using Strings for uint256;

contract UseLibrary {
    function getString(uint256 _number) public pure returns(string memory) {
        return _number.toHexString();
    }

    function getString2(uint256 _number) public pure returns(string memory) {
        return Strings.toHexString(_number);
    }
}