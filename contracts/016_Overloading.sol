// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract Overloading {
    function saySomething() public pure returns(string memory) {
        return("Nothing");
    }

    function saySomething(string memory something) public pure returns(string memory) {
        return(something);
    }

    function f(uint8 _in) public pure returns(uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns(uint256 out) {
        out = _in;
    }

    function callF() public pure {
        // f(50); // error
        // f(uint8(50)); // error
        f(uint256(50)); // success
    }
}