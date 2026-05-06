// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // Track each voter's choice per proposal
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    // Creates a new proposal with the given target address and execution data
    function newProposal(address target, bytes calldata data) external {
        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );
    }

    // Casts or updates a vote on an existing proposal
    // Allows users to change their previous vote choice
    function castVote(uint proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];

        // If user already voted before
        if (hasVoted[proposalId][msg.sender]) {
            bool previousVote = voteChoice[proposalId][msg.sender];

            // If changing from YES -> NO
            if (previousVote && !support) {
                proposal.yesCount -= 1;
                proposal.noCount += 1;
            }

            // If changing from NO -> YES
            else if (!previousVote && support) {
                proposal.noCount -= 1;
                proposal.yesCount += 1;
            }
        } 
        else {
            // First time voting
            if (support) {
                proposal.yesCount += 1;
            } else {
                proposal.noCount += 1;
            }

            hasVoted[proposalId][msg.sender] = true;
        }

        // Always update latest vote
        voteChoice[proposalId][msg.sender] = support;
    }
}