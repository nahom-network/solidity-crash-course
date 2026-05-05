// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/console.sol";

// SPDX-License-Identifier: MIT
// File: Contract.sol
// Type: MODIFIED CODE


contract Contract {
    address public owner;
    address public charity;
    
    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
        console.log(msg.value);
    }

    function tip() external payable {
        console.log(msg.value);
        (bool s, ) = owner.call {value: msg.value}("");
        require(s);
    }

    function donate() external payable {
        (bool s,) = charity.call{value: address(this).balance}("");
        require(s);
        selfdestruct(payable(msg.sender));
    }
}