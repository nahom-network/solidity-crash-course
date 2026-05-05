# Practice Data Types

**Version:** 0.8.20 Foundry

**Stages:** 5

## Introduction

## Basic Solidity Data Types

In this tutorial we'll learn basic Solidity data types!

We'll use state variables to store them in the contract's persistent data storage:

```solidity
contract Contract {
    bool public value = true;
    int public a = 10;
    string public msg = "Hello World";
}
```

We're going to have to look at each of these data types in closer detail. <emoji id="microscope" />

Since Smart Contracts deal primarily with digital value, it's important to understand everything that is happening on a low level. Any mistake could have dire consequences! It's also important to do things **efficiently** since all storage and computation on the blockchain will cost money.

With this in mind, let's dive into Basic Solidity Data Types!

## Code Files

| File             | Type      | Location     | Status   |
| ---------------- | --------- | ------------ | -------- |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.t.sol` | Reference | `reference/` | Initial  |
| `Contract.t.sol` | Reference | `reference/` | Initial  |
| `Contract.t.sol` | Reference | `reference/` | Initial  |
| `Contract.t.sol` | Reference | `reference/` | Initial  |
| `Contract.t.sol` | Reference | `reference/` | Initial  |

## File Structure

```
├── contracts/    # Main contract files
├── tests/        # Test files
├── reference/    # Read-only reference files
├── container_metadata.json
└── README.md     # This file
```
