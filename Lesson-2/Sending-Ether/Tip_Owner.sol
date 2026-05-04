// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title TipOwner Contract
 * @dev Allows users to send tips to the contract owner and donate funds to charity
 * @notice Demonstrates ETH transfers and contract self-destruction patterns
 */
contract Contract {
    /// @notice The owner who receives tips
    address public owner;
    
    /// @notice The charity address that receives funds on contract destruction
    address public charity;
    
    /// @notice Total tips received by the contract
    uint public totalTips;

    /**
     * @notice Initialize the contract with owner and charity address
     * @param _charity The address of the charity to receive funds
     */
    constructor(address _charity) {
        require(_charity != address(0), "Invalid charity address");
        owner = msg.sender;
        charity = _charity;
    }

    /**
     * @notice Send a tip to the owner using the call pattern
     * @dev Uses low-level call for safe ETH transfer
     */
    function tip() public payable {
        require(msg.value > 0, "Tip amount must be greater than 0");
        totalTips += msg.value;
        
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer to owner failed");
    }

    /**
     * @notice Allow contract to receive ETH directly
     * @dev Fallback function for receiving ether
     */
    receive() external payable {}

    /**
     * @notice Destroy the contract and send all funds to charity
     * @dev Only owner can call this function
     */
    function donate() public {
        require(msg.sender == owner, "Only owner can donate");
        selfdestruct(payable(charity));
    }
}