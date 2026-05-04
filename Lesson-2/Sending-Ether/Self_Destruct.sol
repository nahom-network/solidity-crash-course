// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 4: Use selfdestruct to send remaining balance to charity
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

    // selfdestruct sends all contract ETH to the given address and removes bytecode
    function donate() public {
        selfdestruct(payable(charity));
    }
}
