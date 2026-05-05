// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

// SPDX-License-Identifier: MIT
// File: SuperHeroes.sol
// Type: MODIFIED CODE


// Create Mage contract that inherits from Hero with 50 initial health
contract Mage is Hero(50) {
    // Override the attack function for Mage
    function attack(Enemy enemy) public override {
        // Invoke takeAttack with Spell attack type
        enemy.takeAttack(AttackTypes.Spell);
        // Call the base contract's attack function
        super.attack(enemy);
    }
}

// Create Warrior contract that inherits from Hero with 200 initial health
contract Warrior is Hero(200) {
    // Override the attack function for Warrior
    function attack(Enemy enemy) public override {
        // Invoke takeAttack with Brawl attack type
        enemy.takeAttack(AttackTypes.Brawl);
        // Call the base contract's attack function
        super.attack(enemy);
    }
}