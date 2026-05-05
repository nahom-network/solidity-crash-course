// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint256 public base = 10;

    // view functions can read state but not modify it
    function addToBase(uint256 x) external view returns (uint256) {
        return base + x;
    }

    function multiplyBase(uint256 x) external view returns (uint256) {
        return base * x;
    }
}
