// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Revert in constructor: prevent bad deployments from the start
contract Contract {
    address public owner;
    uint256 public minDeposit;

    constructor(uint256 _minDeposit) payable {
        require(msg.value >= _minDeposit, "Must fund at least minDeposit on deploy");
        owner = msg.sender;
        minDeposit = _minDeposit;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    receive() external payable {}
}
