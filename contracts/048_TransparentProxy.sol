// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract Foo {
    bytes4 public selector1 = bytes4(keccak256("burn(uint256)"));
    bytes4 public selector2 = bytes4(keccak256("collate_propagate_storage(bytes16)"));
    // function burn(uint256) external {}
    // function collate_propagate_storage(bytes16) external {}
}

contract TransparentProxy {
    address public implementation;
    address public admin;
    string public words;

    constructor(address _implementation) {
        admin = msg.sender;
        implementation = _implementation;
    }

    fallback() external payable {
        require(msg.sender != admin);
        (bool success, bytes memory data) = implementation.delegatecall(msg.data);
    }

    function upgrade(address newImplementation) external {
        if (msg.sender != admin) revert();
        implementation = newImplementation;
    }
}

contract Login1 {
    address public implementation;
    address public admin;
    string public words;

    function foo() public {
        words = "old";
    }
}

contract Login2 {
    address public implementation;
    address public admin;
    string public words;

    function foo() public {
        words = "new";
    }
}