// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Step 1: Define the three escrow parties as state variables
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
}
