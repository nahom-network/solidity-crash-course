// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Storage variables are persisted on the blockchain
    uint256 public storedNumber;
    address public owner;
    bool public isActive;

    constructor() {
        owner = msg.sender;
        storedNumber = 0;
        isActive = true;
    }

    function setNumber(uint256 _number) external {
        storedNumber = _number;
    }

    function setActive(bool _active) external {
        isActive = _active;
    }
}
