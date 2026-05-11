// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Complete step-by-step Voting contract – the final build from the lesson

contract Voting {
    struct Proposal {
        address target;   // contract to call if proposal passes
        bytes data;       // encoded function call
        uint256 yesCount;
        uint256 noCount;
        bool executed;
    }

    Proposal[] public proposals;

    mapping(address => bool) public isMember;
    // proposalId => voter => hasVoted
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    // proposalId => voter => choice (true = yes)
    mapping(uint256 => mapping(address => bool)) public voteChoice;

    event ProposalCreated(uint256 indexed proposalId);
    event VoteCast(uint256 indexed proposalId, address indexed voter, bool support);
    event ProposalExecuted(uint256 indexed proposalId);

    uint256 public constant QUORUM = 10;

    constructor(address[] memory initialMembers) {
        isMember[msg.sender] = true;
        for (uint256 i = 0; i < initialMembers.length; i++) {
            isMember[initialMembers[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a member");
        _;
    }

    function newProposal(address target, bytes calldata data)
        external
        onlyMember
    {
        proposals.push(Proposal({
            target: target,
            data: data,
            yesCount: 0,
            noCount: 0,
            executed: false
        }));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint256 proposalId, bool support) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposal");

        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Already executed");

        // Allow vote change: reverse previous tally first
        if (hasVoted[proposalId][msg.sender]) {
            bool prev = voteChoice[proposalId][msg.sender];
            if (prev) proposal.yesCount--;
            else proposal.noCount--;
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        if (support) proposal.yesCount++;
        else proposal.noCount++;

        emit VoteCast(proposalId, msg.sender, support);

        // Execute automatically when quorum is reached
        if (!proposal.executed && proposal.yesCount >= QUORUM) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
            emit ProposalExecuted(proposalId);
        }
    }

    function getProposalCount() external view returns (uint256) {
        return proposals.length;
    }
}
