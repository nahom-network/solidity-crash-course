// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 1: Store the deployer as the owner
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}
}
