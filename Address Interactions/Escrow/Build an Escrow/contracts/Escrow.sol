// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// SPDX-License-Identifier: MIT
// File: Escrow.sol
// Type: MODIFIED CODE



contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint amount);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");

        uint amount = address(this).balance;

        payable(beneficiary).transfer(amount);

        emit Approved(amount);
    }
}