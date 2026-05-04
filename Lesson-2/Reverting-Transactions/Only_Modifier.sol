// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Use a modifier to reuse the onlyOwner guard across multiple functions
contract Contract {
    uint256 public configA;
    uint256 public configB;
    uint256 public configC;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setA(uint256 _configA) public onlyOwner {
        configA = _configA;
    }

    function setB(uint256 _configB) public onlyOwner {
        configB = _configB;
    }

    function setC(uint256 _configC) public onlyOwner {
        configC = _configC;
    }
}
