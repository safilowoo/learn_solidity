// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Event {
    mapping(address => uint256) public _balances;
    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) external {
        _balances[from] = 10000000;
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
    }
}