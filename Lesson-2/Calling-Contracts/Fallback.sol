// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 4: Call with an unknown / unrecognized selector – triggers fallback()
contract Sidekick {
    function makeContact(address hero) external {
        // This selector does not match any real function → triggers fallback
        (bool success, ) = hero.call(
            abi.encodePacked(bytes4(0x12345678))
        );
        require(success, "Call failed");
    }
}
