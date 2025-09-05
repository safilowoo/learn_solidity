// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

import "hardhat/console.sol";

contract Pair {
    address public factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "USwapV2 FORBIDDEN");
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory2 {
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    function createPair2(address tokenA, address tokenB) external returns(address pairAddr) {
        require(tokenA != tokenB, "IDENTICAL_ADDRESS");
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));

        Pair pair = new Pair{salt: salt}();
        pair.initialize(tokenA, tokenB);

        pairAddr = address(pair);
        address predictedAddress = calculateAddr(tokenA, tokenB);
        // check pairAddr predictedAddress
        console.log(pairAddr, predictedAddress, pairAddr==predictedAddress);

        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }

    function calculateAddr(address tokenA, address tokenB) public view returns(address predictedAddress) {
        require(tokenA != tokenB, "INDENTICAL_ADDRESS");
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(type(Pair).creationCode)
        )))));
    }
}