// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract Pair {
    address public factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "UniswapV2: FORBIDDEN");
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPiars;

    function createPair(address tokenA, address tokenB) external returns (address pairAddr) {
        Pair pair = new Pair();

        pair.initialize(tokenA, tokenB);
        pairAddr = address(pair);
        allPiars.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }
}