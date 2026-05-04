// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Step 5: Add isApproved flag to prevent double-approval
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved;

    event Approved(uint256 amount);

    constructor(address _arbiter, address _beneficiary) payable {
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
        payable(beneficiary).transfer(amount);
    }
}
