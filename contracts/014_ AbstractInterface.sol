// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

abstract contract Base {
    function foo(uint256 a) public pure virtual returns(uint256 x);
    function bar() public pure virtual returns(uint256 x)  {
        return(1);
    }
}

contract Base1 is Base {
    function foo(uint256 a) public pure override returns(uint256 x) {
        return(a**a);
    }
}

interface InterfaceBase {
    function foo() external pure returns(string memory);
    function bar() external pure returns(string memory);
}

contract Base2 is InterfaceBase {
    function foo() external pure override  returns(string memory){
        return ("foo called");
    }

    function bar() external pure override returns(string memory) {
        return ("bar called");
    }
}