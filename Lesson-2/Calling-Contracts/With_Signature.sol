// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Step 3: Encode function signature + arguments with abi.encodeWithSignature
contract Sidekick {
    function sendAlert(address hero, uint256 enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature(
                "alert(uint256,bool)",
                enemies,
                armed
            )
        );
        require(success, "Call failed");
    }
}
