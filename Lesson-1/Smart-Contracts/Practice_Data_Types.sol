// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Boolean
    bool public isReady = true;

    // Unsigned integers
    uint8 public smallNumber = 200;
    uint256 public bigNumber = 1_000_000;

    // Signed integers
    int8 public negativeNumber = -42;
    int256 public largeNegative = -999_999;

    // Address
    address public contractOwner = 0x000000000000000000000000000000000000dEaD;

    // Bytes
    bytes32 public fixedData = "hello solidity";

    // String
    string public message = "Practice makes perfect";

    // Enum
    enum Status { Inactive, Active, Paused }
    Status public currentStatus = Status.Active;
}
