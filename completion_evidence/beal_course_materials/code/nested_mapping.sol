// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract contract {

    enum ConnectionTypes { None, Friend, Blocked }

    // nested mapping: sender => receiver => connection type
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes connectionType) external {
        connections[msg.sender][other] = connectionType;
    }
}