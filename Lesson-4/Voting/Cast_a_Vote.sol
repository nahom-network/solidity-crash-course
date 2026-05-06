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

    // Creates a new proposal and adds it to the list of proposals
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

    // Cast a vote on a proposal (true for yes, false for no)
    function castVote(uint proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];

        if (support) {
            proposal.yesCount += 1;
        } else {
            proposal.noCount += 1;
        }
    }
}