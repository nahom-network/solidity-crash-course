// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

/**
 * @title Mage Contract
 * @dev Represents a Mage hero with spell attack capabilities
 * @notice Inherits from Hero and overrides the attack function
 */
contract Mage is Hero(50) {
    /// @notice The attack type for this mage
    string public constant ATTACK_TYPE = "Spell";
    
    /// @notice Number of spells cast by this mage
    uint public spellsCast;
    
    /**
     * @notice Execute a spell attack on an enemy
     * @param enemy The target enemy to attack
     * @dev Overrides Hero's attack function with spell-specific behavior
     */
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
        spellsCast++;
        super.attack(enemy);
    }
}

/**
 * @title Warrior Contract
 * @dev Represents a Warrior hero with melee attack capabilities
 * @notice Inherits from Hero and overrides the attack function
 */
contract Warrior is Hero(200) {
    /// @notice The attack type for this warrior
    string public constant ATTACK_TYPE = "Brawl";
    
    /// @notice Number of brawls engaged in by this warrior
    uint public brawlsEngaged;
    
    /**
     * @notice Execute a brawl attack on an enemy
     * @param enemy The target enemy to attack
     * @dev Overrides Hero's attack function with melee-specific behavior
     */
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
        brawlsEngaged++;
        super.attack(enemy);
    }
}