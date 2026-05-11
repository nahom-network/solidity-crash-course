// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//call data
contract Contract {
    function filterEven(uint[] calldata oddEven) pure external returns(uint[] memory) {
        uint count = 0;
        for (uint i = 0; i < oddEven.length; i++) {
            if (oddEven[i] % 2 == 0) count++;
        }

        uint[] memory evens = new uint[](count);
        
        // Fill the array
        uint index = 0;
        for (uint i = 0; i < oddEven.length; i++) {
            if (oddEven[i] % 2 == 0) {
                evens[index] = oddEven[i];
                index++;
            }
        }
        
        return evens;
    }
}


