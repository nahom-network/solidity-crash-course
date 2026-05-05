// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT
// File: Voting.sol
// Type: MODIFIED CODE


contract Voting {
    // Define events
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);
    
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // Track if proposal has been executed
        // Track votes for this proposal
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }
    
    // Create a public array of type Proposal called proposals
    Proposal[] public proposals;
    
    // Track voting members
    mapping(address => bool) public isMember;
    
    // Constructor takes an array of addresses and adds them plus the deployer as members
    constructor(address[] memory initialMembers) {
        // Add the deployer as a member
        isMember[msg.sender] = true;
        
        // Add all initial members from the array
        for (uint i = 0; i < initialMembers.length; i++) {
            isMember[initialMembers[i]] = true;
        }
    }
    
    // Modifier to check if caller is a member
    modifier onlyMember() {
        require(isMember[msg.sender], "Not a voting member");
        _;
    }
    
    // External function to create a new proposal (only members)
    function newProposal(address target, bytes calldata data) external onlyMember {
        // Create a new Proposal with the arguments passed in
        Proposal storage newProposal = proposals.push();
        newProposal.target = target;
        newProposal.data = data;
        newProposal.yesCount = 0;
        newProposal.noCount = 0;
        newProposal.executed = false;
        
        // Emit event with the proposal ID (index of the new proposal)
        emit ProposalCreated(proposals.length - 1);
    }
    
    // External function to cast a vote on a proposal (only members)
    function castVote(uint proposalId, bool support) external onlyMember {
        // Get the proposal from the array using the proposalId as index
        Proposal storage proposal = proposals[proposalId];
        
        // Check if proposal has already been executed
        require(!proposal.executed, "Proposal already executed");
        
        // Check if the voter has already voted on this proposal
        if (proposal.hasVoted[msg.sender]) {
            // If they voted before, get their previous vote
            bool previousVote = proposal.votedYes[msg.sender];
            
            // If the new vote is different from the previous vote
            if (previousVote != support) {
                // Adjust the vote counts accordingly
                if (previousVote) {
                    // Previously voted yes, now voting no
                    proposal.yesCount--;
                    proposal.noCount++;
                } else {
                    // Previously voted no, now voting yes
                    proposal.noCount--;
                    proposal.yesCount++;
                }
                // Update their vote
                proposal.votedYes[msg.sender] = support;
            }
            // If the vote is the same, do nothing (no change needed)
        } else {
            // First time voting
            if (support) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            // Mark that they have voted and record their vote
            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = support;
        }
        
        // Emit the VoteCast event for any vote cast (both new and changed)
        emit VoteCast(proposalId, msg.sender);
        
        // Check if proposal has reached 10 yes votes and hasn't been executed yet
        if (proposal.yesCount >= 10 && !proposal.executed) {
            // Mark as executed to prevent re-execution
            proposal.executed = true;
            
            // Execute the proposal by sending data to the target address
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
            
            // Emit execution event
            emit ProposalExecuted(proposalId);
        }
    }
}