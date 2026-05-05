// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint256 public x = 0;

    function increment() external {
        x += 1;
    }

    function incrementBy(uint256 amount) external {
        x += amount;
    }
}
