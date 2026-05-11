// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BoolContract {
    struct Chooser {
        uint256 weight;
        bool voted;
        address delegate;
        bool vote;
    }

    bool public condition;
    uint256 public lastValue;

    constructor(bool cond) {
        condition = cond;
        if (cond) {
            lastValue = 2000;
        } else {
            lastValue = 4000;
        }
    }
}