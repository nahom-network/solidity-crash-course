// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

// SPDX-License-Identifier: MIT
// File: Enemy.sol
// Type: INITIAL CODE


contract Enemy {
    uint public health = 100;

	function takeAttack(Hero.AttackTypes attackType) external {
        if(attackType == Hero.AttackTypes.Brawl) {
            health -= 50;
        }
        else if(attackType == Hero.AttackTypes.Spell) {
            health -= 80;
        }
	}
}