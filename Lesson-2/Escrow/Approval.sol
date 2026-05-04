// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Final: complete Escrow contract with all features
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved;

    event Approved(uint256 amount);

    constructor(address _arbiter, address _beneficiary) payable {
        require(_arbiter != address(0), "Invalid arbiter");
        require(_beneficiary != address(0), "Invalid beneficiary");
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        require(msg.sender == arbiter, "Not arbiter");
        require(!isApproved, "Already approved");

        isApproved = true;
        uint256 amount = address(this).balance;
        emit Approved(amount);

        (bool success, ) = beneficiary.call{value: amount}("");
        require(success, "Transfer failed");
    }
}
