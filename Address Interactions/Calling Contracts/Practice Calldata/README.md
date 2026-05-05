# Practice Calldata

**Version:** Foundry 0.8.20

**Stages:** 5

## Introduction

## Calldata

When we want to communicate with a smart contract, we send a transaction from an Externally Owned Account. Inside of that transaction is a `data` property which is commonly referred to as the "calldata". This call data format is the same for calling solidity functions whether it is in a transaction from an EOA or if its in a message call from one contract to another.

The format looks a little like this. Let's say you wanted to call a method `approve` on a contract, that takes a `uint`:

```solidity
function approve(uint val) external;
```

<emoji id="point_up" /> We can target this function by taking its signature and hashing it with keccak256, then taking the first 4 bytes. So for approve here, it would be the `keccak256("approve(uint256)")`. The first 4 bytes of the resulting hash is `0xb759f954`. This is the first part of our calldata!

Then we need to decide how much we want to approve. What is our `val`? Let's say it was `15`, that would `0xf` in hexadecimal. We will need to pad this value out to 256 bits, or 64 hexadecimal characters. The resulting value will be:

```
000000000000000000000000000000000000000000000000000000000000000f
```

If we combine this with the function signature, our call data would look like this:

```
0xb759f954000000000000000000000000000000000000000000000000000000000000000f
```

Regardless of whether its in a transaction from an EOA or a message call from one contract to another, this would be our calldata sending `15` to an approve function.

Ready to start working with calldata? Let's jump in!

## Code Files

| File             | Type      | Location     | Status   |
| ---------------- | --------- | ------------ | -------- |
| `Sidekick.sol`   | Contract  | `contracts/` | Modified |
| `Sidekick.sol`   | Contract  | `contracts/` | Modified |
| `Sidekick.sol`   | Contract  | `contracts/` | Modified |
| `Sidekick.sol`   | Contract  | `contracts/` | Modified |
| `Sidekick.sol`   | Contract  | `contracts/` | Modified |
| `Hero.sol`       | Reference | `reference/` | Initial  |
| `Hero.sol`       | Reference | `reference/` | Initial  |
| `Hero.sol`       | Reference | `reference/` | Initial  |
| `Hero.sol`       | Reference | `reference/` | Initial  |
| `Hero.sol`       | Reference | `reference/` | Initial  |
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
