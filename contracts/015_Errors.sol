// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol"; 

error TransferNotOwner();

contract Errors {
    mapping(uint256 => address) _owners;
    
    function writeMap(uint256 tokenId, address owner) public {
        _owners[tokenId] = owner;
    }

    function transferOwner1(uint256 tokenId, address newOwner) public {
        console.log(1111, _owners[tokenId], msg.sender);
        if(_owners[tokenId] != msg.sender) {
            revert TransferNotOwner();
        }
        _owners[tokenId] = newOwner;
    }

    function transferOwner2(uint256 tokenId, address newOwner) public {
        require(_owners[tokenId] == msg.sender, "Transfer Not Owner");
        _owners[tokenId] = newOwner;
    }

    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }
}