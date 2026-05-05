# Practice Inheritance

**Version:** Foundry 0.8.20

**Stages:** 6

## Introduction

## Contract Inheritance

As with many object-oriented languages, Solidity includes **inheritance** as a feature.

Inheritance means that you can create an object with some values/methods and use it as a **base** for other objects.

In Solidity, the objects we're referring to are contracts and interfaces. We can write a contract with state variables and functions. Then we can create contracts that **inherit** those variables and functions. These **derived** contracts can then choose to add behavior as necessary.

This use case may seem quite similar to libraries! Just like libraries, code re-use is a big motivation for inheritance. We'll take a look at why inheritance can be a more powerful feature than libraries. Of course, that power comes with tradeoffs! With time and practice you'll be able to understand these tradeoffs and figure out which tool is right for the particular job at hand. <emoji id="hammer_and_wrench" />

## Code Files

| File                | Type      | Location     | Status   |
| ------------------- | --------- | ------------ | -------- |
| `SuperHeroes.sol`   | Contract  | `contracts/` | Modified |
| `BaseContracts.sol` | Contract  | `contracts/` | Modified |
| `Hero.sol`          | Reference | `reference/` | Initial  |
| `Collectible.sol`   | Reference | `reference/` | Initial  |
| `Collectible.sol`   | Reference | `reference/` | Initial  |
| `Hero.sol`          | Reference | `reference/` | Initial  |
| `Hero.sol`          | Reference | `reference/` | Initial  |
| `Enemy.sol`         | Reference | `reference/` | Initial  |
| `Hero.sol`          | Reference | `reference/` | Initial  |
| `SuperHeroes.t.sol` | Reference | `reference/` | Initial  |
| `Collectible.t.sol` | Reference | `reference/` | Initial  |
| `Collectible.t.sol` | Reference | `reference/` | Initial  |
| `SuperHeroes.t.sol` | Reference | `reference/` | Initial  |
| `SuperHeroes.t.sol` | Reference | `reference/` | Initial  |
| `SuperHeroes.t.sol` | Reference | `reference/` | Initial  |

## File Structure

```
├── contracts/    # Main contract files
├── tests/        # Test files
├── reference/    # Read-only reference files
├── container_metadata.json
└── README.md     # This file
```
