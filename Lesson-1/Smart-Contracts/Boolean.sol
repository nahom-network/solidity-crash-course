// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Boolean Contract
 * @dev Demonstrates basic boolean data types in Solidity
 * @notice This contract showcases the declaration and usage of boolean values
 */
contract Contract {
    /// @dev Boolean variable initialized to true
    bool public a = true;
    
    /// @dev Boolean variable initialized to false
    bool public b = false;
    
    /**
     * @notice Toggle the state of boolean variable a
     * @dev Flips the value of a using the NOT operator
     */
    function toggleA() external {
        a = !a;
    }
    
    /**
     * @notice Toggle the state of boolean variable b
     * @dev Flips the value of b using the NOT operator
     */
    function toggleB() external {
        b = !b;
    }
}