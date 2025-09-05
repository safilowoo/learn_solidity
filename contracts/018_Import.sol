// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

import './013_Inheritance.sol';
import { Yeye } from './013_Inheritance.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract Import {
    using Address for address;
    Yeye yeye = new Yeye();
    function test() external {
        yeye.hip();
    }
}