// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Owner {
    address public owner ;

    constructor(address initialOwner) {
        owner = initialOwner;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address _newAddress) external onlyOwner {
        owner = _newAddress;
    }
}