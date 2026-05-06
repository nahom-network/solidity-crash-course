// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// A simple contract to demonstrate iterating over a dynamic array
contract Contract {
    
    // Calculates the sum of all elements in a dynamic array of unsigned integers
    // @param numbers A dynamic array of uints passed as calldata to save gas
    // @return The total sum of the numbers in the array
    function sum(uint[] calldata numbers) external pure returns (uint) {
        // Initialize a variable to keep track of the running total
        uint total = 0;

        // Loop through each element in the 'numbers' array
        // 'numbers.length' gives the total number of elements in the array
        for (uint i = 0; i < numbers.length; i++) {
            // Add the current element to the 'total'
            total += numbers[i];
        }

        // Return the calculated total
        return total;
    }
}