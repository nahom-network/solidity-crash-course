// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT
// File: Hero.sol
// Type: INITIAL CODE


contract Hero {
    Ambush public ambush;

    struct Ambush {
        bool alerted;
        uint enemies;
        bool armed;
    }

    uint lastContact;

    function alert(uint enemies, bool armed) external {
        ambush = Ambush(true, enemies, armed);
    }
}