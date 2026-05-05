// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // pure functions do not read or modify state
    function double(uint256 x) external pure returns (uint256) {
        return x * 2;
    }

    function triple(uint256 x) external pure returns (uint256) {
        return x * 3;
    }
}
