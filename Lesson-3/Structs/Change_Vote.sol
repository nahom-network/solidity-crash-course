pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    mapping(address => bool) public hasVoted;
    mapping(address => uint) public voteIndex;

    function createVote(Choices choice) external {
        require(!hasVoted[msg.sender], "Already voted");

        votes.push(Vote(choice, msg.sender));

        voteIndex[msg.sender] = votes.length - 1;
        hasVoted[msg.sender] = true;
    }

    function changeVote(Choices newChoice) external {
        require(hasVoted[msg.sender], "No existing vote");

        uint index = voteIndex[msg.sender];
        votes[index].choice = newChoice;
    }

    function findChoice(address user) external view returns (Choices) {
        require(hasVoted[user], "No vote found");

        uint index = voteIndex[user];
        return votes[index].choice;
    }
}