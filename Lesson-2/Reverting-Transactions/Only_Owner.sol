// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Revert with if/revert to guard owner-only functions
contract Contract {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function withdraw() public {
        if (msg.sender != owner) {
            revert("Not owner");
        }

        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    receive() external payable {}
}
