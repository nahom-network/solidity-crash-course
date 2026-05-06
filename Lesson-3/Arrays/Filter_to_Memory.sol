// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    // Filters an array to return only even numbers
    function filterEven(uint[] calldata numbers)
        external
        pure
        returns (uint[] memory)
    {
        uint count = 0;

        // 1. Count the number of even numbers to determine array size
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        // 2. Initialize a fixed-size memory array to hold the even numbers
        uint[] memory evens = new uint[](count);

        // 3. Populate the new array with the even numbers
        uint index = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }

        return evens;
    }
}