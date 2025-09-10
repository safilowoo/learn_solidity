// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}