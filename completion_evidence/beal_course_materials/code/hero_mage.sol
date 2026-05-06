// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Hero {
    uint256 public health = 100;

    function takeDamage(uint256 amount) public {
        health -= amount;
    }
}

contract Warrior is Hero(200) {
    // override attack function
    function attack(Enemy _enemy) public override {
        // Invoke takeAttack with Brawl
        _enemy.takeAttack(AttackTypes.Brawl);
    }
}

contract Mage is Hero(50) {
    // override attack function
    function attack(Enemy _enemy) public override {
        //Invoke takeAttack with Spell
        _enemy.takeAttack(AttackTypes.Spell);
    }
}