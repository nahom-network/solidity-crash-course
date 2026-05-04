// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Message calls: how contracts interact using call, transfer, and send
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // msg.value  – ETH sent with the call (in wei)
    // msg.sender – address that initiated the call
    // msg.data   – calldata bytes sent with the call

    function deposit() public payable {
        // msg.value is the ETH attached to this transaction
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Recommended way to send ETH: low-level call
    function sendToOwner() public {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "ETH transfer failed");
    }

    receive() external payable {}
}
