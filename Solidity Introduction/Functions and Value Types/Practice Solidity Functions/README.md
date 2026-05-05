# Practice Solidity Functions

**Version:** Foundry 0.8.20

**Stages:** 6

## Introduction

## Solidity Functions

We've learned about how to store values inside of our smart contracts. Now it's time to learn how to read and modify those values! We accomplish this by adding **functions** to our contract code.

Technically we already created functions in the previous lesson on **data types**! By setting our state variables to **public**, the compiler was creating a getter function under the hood:

```solidity
contract Contract {
    uint public x = 3;
}
```

<emoji id="point_up" /> We can query the value in `x` externally using a generated function called `x()`.

What if we wanted to modify `x`? <emoji id="thinking_face" />

```solidity
contract Contract {
    uint public x = 3;

    function changeX() external {
        x = 5;
    }
}
```

Cool! <emoji id="sunglasses" />

That's just a taste of what's to come! Let's learn about functions.

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
| `Secret.sol`     | Reference | `reference/` | Initial  |

## File Structure

```
├── contracts/    # Main contract files
├── tests/        # Test files
├── reference/    # Read-only reference files
├── container_metadata.json
└── README.md     # This file
```
