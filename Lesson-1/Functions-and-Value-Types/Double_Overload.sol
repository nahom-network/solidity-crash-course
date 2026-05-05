// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Solidity supports function overloading - same name, different parameter types
    function double(uint256 x) external pure returns (uint256) {
        return x * 2;
    }

    function double(int256 x) external pure returns (int256) {
        return x * 2;
    }
}
