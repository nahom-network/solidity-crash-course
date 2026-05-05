// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";

contract Contract {
    uint256 public value = 42;

    function logValue() external view {
        console.log("The value is:", value);
    }

    function logSum(uint256 a, uint256 b) external pure {
        console.log("Sum:", a + b);
    }
}
