// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Practice: work with fixed and dynamic arrays, push/pop, and iteration
contract Contract {
    // Dynamic storage array
    uint256[] public numbers;

    // Fixed-size array
    uint256[5] public top5;

    // Add a number to the dynamic array
    function addNumber(uint256 n) external {
        numbers.push(n);
    }

    // Remove the last element
    function removeLast() external {
        require(numbers.length > 0, "Array is empty");
        numbers.pop();
    }

    // Return the length of the dynamic array
    function getLength() external view returns (uint256) {
        return numbers.length;
    }

    // Return the sum of all elements in the dynamic array
    function sum() external view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }

    // Return only the elements greater than a threshold (in memory)
    function filterAbove(uint256 threshold)
        external
        view
        returns (uint256[] memory)
    {
        uint256 count = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] > threshold) count++;
        }

        uint256[] memory result = new uint256[](count);
        uint256 idx = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] > threshold) {
                result[idx] = numbers[i];
                idx++;
            }
        }
        return result;
    }

    // Set a value in the fixed-size array
    function setTop5(uint256 index, uint256 value) external {
        require(index < 5, "Index out of bounds");
        top5[index] = value;
    }
}
