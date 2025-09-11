// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract UUPSProxy {
    address public implementation;
    address public admin;
    string public words;

    constructor(address _implementation) {
        admin = msg.sender;
        implementation = _implementation;
    }

    fallback() external payable {
        (bool success, bytes memory data) = implementation.delegatecall(msg.data);
    }
}

contract UUPS1 {
    address public implementation;
    address public admin;
    string public words;

    // selector id: 0xc2985578
    function foo() public {
        words = "old";
    }

    function upgrade(address newImplementation) external {
        require(msg.sender == admin);
        implementation = newImplementation;
    }
}

contract UUPS2 {
    address public implementation;
    address public admin;
    string public words;

    // selector id: 0xc2985578
    function foo() public {
        words = "new";
    }

    function upgrade(address newImplementation) external {
        require(msg.sender == admin);
        implementation = newImplementation;
    }
}