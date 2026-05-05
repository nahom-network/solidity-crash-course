// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// SPDX-License-Identifier: MIT
// File: BaseContracts.sol
// Type: MODIFIED CODE


contract Ownable {
    address public owner;
    
    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    // Constructor sets the deployer as the owner
    constructor() {
        owner = msg.sender;
    }
}

contract Transferable is Ownable {
    // Function to transfer ownership to a new address
    function transfer(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        owner = newOwner;
    }
}