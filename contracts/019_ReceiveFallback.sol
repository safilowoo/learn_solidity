// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract ReceiveFallback {
    event Received(address Sender, uint Value);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    event fallbackCalled(address Sender, uint Value, bytes Data);

    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}