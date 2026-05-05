// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT
// File: Sidekick.sol
// Type: MODIFIED CODE


contract Sidekick {
    function relay(address hero, bytes memory data) external {
        (bool s,) = hero.call(
            data
        );
        require(s);
    }
}