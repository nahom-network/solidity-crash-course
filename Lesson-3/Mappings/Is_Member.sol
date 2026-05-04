// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Membership Contract
 * @dev Manages a membership registry using mappings
 * @notice Allows adding, removing, and checking membership status
 */
contract Contract {
    /// @notice Mapping to track membership status of each address
    mapping(address => bool) public members;
    
    /// @notice Admin address with special privileges
    address public admin;
    
    /// @notice Total number of active members
    uint public memberCount;
    
    /// @notice Event emitted when a member is added
    event MemberAdded(address indexed user);
    
    /// @notice Event emitted when a member is removed
    event MemberRemoved(address indexed user);
    
    constructor() {
        admin = msg.sender;
    }

    /**
     * @notice Add a user to the membership registry
     * @param user The address to add as a member
     */
    function addMember(address user) external {
        require(msg.sender == admin, "Only admin can add members");
        require(user != address(0), "Invalid address");
        require(!members[user], "User is already a member");
        
        members[user] = true;
        memberCount++;
        emit MemberAdded(user);
    }

    /**
     * @notice Remove a user from the membership registry
     * @param user The address to remove from membership
     */
    function removeMember(address user) external {
        require(msg.sender == admin, "Only admin can remove members");
        require(members[user], "User is not a member");
        
        members[user] = false;
        memberCount--;
        emit MemberRemoved(user);
    }

    /**
     * @notice Check if a user is a member
     * @param user The address to check
     * @return bool True if the user is a member, false otherwise
     */
    function isMember(address user) external view returns (bool) {
        return members[user];
    }
}