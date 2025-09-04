// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ControlFlow {
    function whileTest() public pure returns (uint256) {
        uint sum = 0;
        uint i = 0;
        while(i < 10) {
            sum += i;
            i++;
        }
        return(sum);
    }

}