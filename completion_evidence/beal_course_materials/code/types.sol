// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

type UFixed256x18 is uint256;

library Helpers {
    function unwrap(UFixed256x18 value) internal pure returns (uint256) {
        return UFixed256x18.unwrap(value);
    }

    function clampToUint8(uint256 value) internal pure returns (uint8) {
        if (value > type(uint8).max) {
            return type(uint8).max;
        }
        return uint8(value);
    }
}

contract ContractType {
    uint8 public x = 20;
    uint16 public y = 344;
    int8 public a = 127;
    int256 public b = -267;
    bool public cond = false;

    constructor() {
        a += 1;
    }
}

function helper(uint8 value) pure returns (uint256) {
    return value + 12;
}