// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 2: Accept incoming ETH via receive()
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // receive() is triggered when ETH is sent with no calldata
    receive() external payable {}
}
