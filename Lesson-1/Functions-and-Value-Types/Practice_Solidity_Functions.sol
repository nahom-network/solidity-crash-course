// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint256 public count;
    address public owner;

    constructor() {
        owner = msg.sender;
        count = 0;
    }

    function increment() external {
        count += 1;
    }

    function decrement() external {
        require(count > 0, "Count cannot go below zero");
        count -= 1;
    }

    function reset() external {
        count = 0;
    }

    function getCount() external view returns (uint256) {
        return count;
    }

    function isOwner(address _addr) external view returns (bool) {
        return _addr == owner;
    }
}
