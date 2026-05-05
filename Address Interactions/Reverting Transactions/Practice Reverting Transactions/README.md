# Practice Reverting Transactions

**Version:** Foundry 0.8.20

**Stages:** 3

## Introduction

## Learning Revert <emoji id="lock" />

We've been building up to this lesson for quite a few coding lessons now! It's time to learn the basics of reverting transactions in Solidity!

In this lesson we'll discuss how to detect an error condition and **immediately halt** the smart contract code, stopping any further execution of the transaction that the code is running in, and refunding any remaining gas to the user. The EVM gives us a few ways to **stop a transaction and roll-back any state changes and emitted events** with the `REVERT` EVM opcode.

In Solidity version `^0.8.0` there are 3 ways to express errors in Solidity. They are:

- `assert`
- `require`
- `revert`

Ok, enough talk. Time to dig in!

## Code Files

| File             | Type      | Location     | Status   |
| ---------------- | --------- | ------------ | -------- |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
| `Contract.sol`   | Contract  | `contracts/` | Modified |
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
