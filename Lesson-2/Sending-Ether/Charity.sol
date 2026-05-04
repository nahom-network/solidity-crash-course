// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 5: Practice – restrict donate() to the owner only
contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer failed");
    }

    receive() external payable {}

    function donate() public {
        require(msg.sender == owner, "Only owner can donate");
        selfdestruct(payable(charity));
    }
}
