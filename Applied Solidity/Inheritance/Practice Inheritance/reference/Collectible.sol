// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./BaseContracts.sol";

// SPDX-License-Identifier: MIT
// File: Collectible.sol
// Type: INITIAL CODE


contract Collectible is Ownable, Transferable {
	uint public price;

	function markPrice(uint _price) external onlyOwner {
		price = _price;
	}
}