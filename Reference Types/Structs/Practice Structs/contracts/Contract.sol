// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// SPDX-License-Identifier: MIT
// File: Contract.sol
// Type: MODIFIED CODE


contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// Create a public storage array of the Vote struct called votes
	Vote[] public votes;

	// Private helper function to find the index of a voter
	function _findVoterIndex(address voter) private view returns (int) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == voter) {
				return int(i);
			}
		}
		return -1;
	}
	
	// External view function that returns whether an address has voted
	function hasVoted(address voter) external view returns (bool) {
		return _findVoterIndex(voter) != -1;
	}
	
	// External view function that returns the choice of a voter
	function findChoice(address voter) external view returns (Choices) {
		int index = _findVoterIndex(voter);
		// Since the problem says not to worry about the case where vote wasn't cast,
		// we can assume the index will be found
		return votes[uint(index)].choice;
	}
	
	function createVote(Choices choice) external {
		// Check if the address has already voted using the internal helper function
		require(_findVoterIndex(msg.sender) == -1, "Address has already voted");
		
		// Create a new vote and push it onto the array of votes
		votes.push(Vote(choice, msg.sender));
	}
	
	// External function to change an existing vote
	function changeVote(Choices choice) external {
		// Find the index of the voter
		int index = _findVoterIndex(msg.sender);
		
		// Require that the voter has an existing vote
		require(index != -1, "No existing vote found");
		
		// Change the choice on the existing vote
		votes[uint(index)].choice = choice;
	}
}