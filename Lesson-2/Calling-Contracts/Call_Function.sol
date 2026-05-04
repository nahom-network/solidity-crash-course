// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 1: Call a known function via an interface
interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // Cast the address to the interface and call the function
        IHero(hero).alert();
    }
}
