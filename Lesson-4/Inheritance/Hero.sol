// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Base contracts imported by the Inheritance lesson files

interface Enemy {
    function takeAttack(AttackTypes attackType) external;
}

enum AttackTypes { Brawl, Spell }

abstract contract Hero {
    uint256 public health;

    constructor(uint256 _health) {
        health = _health;
    }

    // virtual – child contracts must override this
    function attack(Enemy enemy) public virtual;
}
