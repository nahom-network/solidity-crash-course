# Lesson 1 – Solidity Introduction

This lesson covers the foundational concepts of Solidity and smart contracts.

## Topics Covered

### Smart Contracts (75% complete)
| File | Description |
|------|-------------|
| `Boolean.sol` | Boolean data type (`true`/`false`) and toggle functions |
| `Unsigned_Integers.sol` | `uint8`, `uint16`, `uint256` and overflow behavior |
| `Signed_Integers.sol` | `int8`, `int16` and negative values |
| `String_Literals.sol` | `string` and `bytes32` types |
| `Enum.sol` | Defining and using enumerations |
| `Practice_Data_Types.sol` | Practice exercise combining all value types |

### Functions and Value Types (0% → completed)
| File | Description |
|------|-------------|
| `Storage_Variables.sol` | State variables persisted on the blockchain |
| `Arguments.sol` | Passing arguments to functions |
| `Pure_Double.sol` | `pure` functions – no state read or write |
| `View_Addition.sol` | `view` functions – read state, no modification |
| `Increment.sol` | Modifying state with functions |
| `Double_Overload.sol` | Function overloading in Solidity |
| `Console_Log.sol` | Debugging with `console.log` (Hardhat) |
| `Practice_Solidity_Functions.sol` | Practice exercise combining functions concepts |

## Key Concepts

- **Value Types**: `bool`, `uint`, `int`, `address`, `bytes`, `string`, `enum`
- **Function Visibility**: `public`, `external`, `internal`, `private`
- **Function Mutability**: `pure` (no state access), `view` (read-only), default (read + write)
- **Storage Variables**: Variables declared at contract level that persist on-chain
- **Function Overloading**: Multiple functions with the same name but different parameter types
