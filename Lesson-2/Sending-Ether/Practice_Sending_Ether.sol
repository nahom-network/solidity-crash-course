// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Practice: a contract that collects ETH and lets the owner withdraw
contract Contract {
    address public owner;
    mapping(address => uint256) public contributions;

    constructor() {
        owner = msg.sender;
    }

    function contribute() public payable {
        require(msg.value > 0, "Must send ETH");
        contributions[msg.sender] += msg.value;
    }

    function getContribution(address contributor) public view returns (uint256) {
        return contributions[contributor];
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner");
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }

    receive() external payable {
        contributions[msg.sender] += msg.value;
    }
}
