// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Practice: encode and forward calldata with various ABI helpers
contract Sidekick {
    // Encode a call to "setValue(uint256)" and forward it
    function setValueOn(address target, uint256 value) external {
        bytes memory data = abi.encodeWithSignature("setValue(uint256)", value);
        (bool success, ) = target.call(data);
        require(success, "setValueOn failed");
    }

    // Encode using selector + abi.encode
    function setValueOnV2(address target, uint256 value) external {
        bytes4 selector = bytes4(keccak256("setValue(uint256)"));
        bytes memory data = abi.encodeWithSelector(selector, value);
        (bool success, ) = target.call(data);
        require(success, "setValueOnV2 failed");
    }

    // Pass raw calldata through unchanged
    function forward(address target, bytes calldata data) external {
        (bool success, ) = target.call(data);
        require(success, "forward failed");
    }
}
