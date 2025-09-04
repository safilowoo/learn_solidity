// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FuctionTypes {
    uint256 public number = 5;

    // error
    // function add () external pure {
    //     number = number + 1;
    // }

    function addPure(uint256 _number) external pure returns(uint256 new_number) {
        new_number = _number + 1;
    }

    function addView() external view returns(uint256 new_number) {
        new_number = number + 1;
    }

    function minus() internal {
        number = number - 1;
    }

    function minusCall() external {
        minus();
    }

    function minusPayable() external payable returns(uint256 balance) {
        minus();
        balance = address(this).balance;
    }
}