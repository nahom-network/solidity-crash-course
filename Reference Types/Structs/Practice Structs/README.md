# Practice Structs

**Version:** Foundry 0.8.20

**Stages:** 6

## Introduction

## Structs

Structs provide Solidity Developers with a way to build **custom data types**. These data types can have multiple fields of data types we already have previously discussed.

For example:

```solidity
struct Account {
    uint balance;
    bool isActive;
}
```

<emoji id="point_up" /> This struct is composed of a `uint` and a `bool`. If this struct were defined outside of a contract, it can be shared across multiple contracts like so:

```solidity
struct Account {
    uint balance
    bool isActive;
}

contract A {
    Account owner;
    Account recipient;
}

contract B {
    mapping (address => Account) accounts;
}
```

Let's dive into some struct code exercises!

## Code Files

| File             | Type      | Location     | Status   |
| ---------------- | --------- | ------------ | -------- |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.t.sol` | Reference | `reference/` | Initial  |
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
