// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    // Define Events
    event ProposalCreated(uint256 proposalId);
    event VoteCast(uint256 proposalId, address voter);

    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => uint8)) public votes;

    function newProposal(address _target, bytes calldata _byte) external {
        uint256 proposalId = proposals.length;
        
        proposals.push(Proposal({
            target: _target,
            data: _byte,
            yesCount: 0,
            noCount: 0
        }));

        // Emit ProposalCreated with the index of the new proposal
        emit ProposalCreated(proposalId);
    }

    function castVote(uint256 _id, bool _supports) external {
        Proposal storage p = proposals[_id];
        uint8 previousVote = votes[_id][msg.sender];

        if (previousVote == 1) {
            p.yesCount--;
        } else if (previousVote == 2) {
            p.noCount--;
        }

        if (_supports) {
            p.yesCount++;
            votes[_id][msg.sender] = 1;
        } else {
            p.noCount++;
            votes[_id][msg.sender] = 2;
        }

        // Emit VoteCast whenever a vote is successfully processed
        emit VoteCast(_id, msg.sender);
    }
}
