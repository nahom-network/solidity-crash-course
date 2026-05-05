// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT
// File: Contract.sol
// Type: MODIFIED CODE


contract Contract {
	enum ConnectionTypes { 
		Unacquainted,
		Friend,
		Family
	}
	
	// Create a public nested mapping `connections`
	// Maps an address to another mapping that maps an address to a ConnectionTypes value
	mapping(address => mapping(address => ConnectionTypes)) public connections;

	function connectWith(address other, ConnectionTypes connectionType) external {
		// Make the connection from msg.sender => other => connectionType
		connections[msg.sender][other] = connectionType;
	}
}