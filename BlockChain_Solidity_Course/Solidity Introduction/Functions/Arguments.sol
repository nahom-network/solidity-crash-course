// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;

    // Initializes the contract with a starting value for x
    constructor(uint _x) {
        x = _x;
    }

    // Increases the value of x by 1
    function increment() external {
        x += 1;
    }

    // Returns the sum of x and a given value without modifying state
    function add(uint _value) external view returns (uint) {
        return x + _value;
    }
}