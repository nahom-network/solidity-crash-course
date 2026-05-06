// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// nested mapping: ProposalID => VoterAddress => VoteType (0: none, 1: yes, 2: no)
contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // Track: ProposalID => VoterAddress => VoteType (0: none, 1: yes, 2: no)
    mapping(uint => mapping(address => uint8)) public votes;

    function newProposal(address _target, bytes calldata _byte) external {
        proposals.push(Proposal({
            target: _target,
            data: _byte,
            yesCount: 0,
            noCount: 0
        }));
    }

    function castVote(uint _id, bool _supports) external {
        Proposal storage p = proposals[_id];
        uint8 previousVote = votes[_id][msg.sender];

        // 1. Remove previous vote if exists
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
    }
}
