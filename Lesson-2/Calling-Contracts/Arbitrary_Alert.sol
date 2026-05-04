// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 5: Relay arbitrary calldata – caller decides what function to invoke
contract Sidekick {
    function relay(address hero, bytes memory data) external {
        (bool success, ) = hero.call(data);
        require(success, "Relay failed");
    }
}
