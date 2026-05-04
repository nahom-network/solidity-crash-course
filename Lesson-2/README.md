# Lesson 2 – Sending Ether, Reverting Transactions, Calling Contracts & Escrow

## Topics Covered

### Sending Ether
| File | Description |
|------|-------------|
| `Storing_Owner.sol` | Store `msg.sender` as the contract owner |
| `Recieve_Ether.sol` | Accept ETH via the `receive()` fallback |
| `Tip_Owner.sol` | Forward tips to the owner using low-level `call` |
| `Self_Destruct.sol` | Send remaining balance to charity with `selfdestruct` |
| `Charity.sol` | Restrict `donate()` to the owner |
| `Message_Calls.sol` | Overview of `msg.value`, `msg.sender`, `msg.data` |
| `Practice_Sending_Ether.sol` | Practice – contribution tracker with owner withdrawal |

### Reverting Transactions
| File | Description |
|------|-------------|
| `Only_Owner.sol` | Guard a function with `if/revert` |
| `Constructor_Revert.sol` | Revert in the constructor to validate deployment conditions |
| `Only_Modifier.sol` | Reuse access control with a custom `modifier` |
| `Practice_Reverting_Transactions.sol` | Practice – shop contract combining require, revert, modifiers |

### Calling Contracts
| File | Description |
|------|-------------|
| `Call_Function.sol` | Call a known function through an interface |
| `Signature.sol` | Compute a 4-byte function selector with `keccak256` |
| `With_Signature.sol` | Encode arguments with `abi.encodeWithSignature` |
| `Fallback.sol` | Trigger a target's `fallback()` with an unknown selector |
| `Arbitrary_Alert.sol` | Relay arbitrary calldata to any address |
| `Practice_Calldata.sol` | Practice – encode and forward calldata multiple ways |

### Escrow (Build an Escrow step-by-step)
| File | Description |
|------|-------------|
| `Setup.sol` | Declare the three escrow parties |
| `Constructor.sol` | Payable constructor to fund escrow at deploy time |
| `Funding.sol` | `approve()` to release funds to the beneficiary |
| `Events.sol` | Emit `Approved` event on fund release |
| `Security.sol` | `isApproved` flag to prevent double-approval |
| `Approval.sol` | Final complete Escrow contract |

## Key Concepts

- **Sending ETH**: `call{value: ...}("")` is the recommended pattern; `transfer` and `send` are legacy
- **receive() / fallback()**: special functions for receiving ETH and unknown calls
- **selfdestruct**: destroys contract bytecode and forces balance to a target address
- **require / revert**: revert all state changes and return remaining gas on failure
- **Modifiers**: reusable function guards declared with the `modifier` keyword
- **Low-level call**: `address.call(data)` returns `(bool success, bytes memory returnData)`
- **ABI encoding**: `abi.encode`, `abi.encodePacked`, `abi.encodeWithSignature`, `abi.encodeWithSelector`
- **Escrow pattern**: three-party trust contract – depositor, arbiter, beneficiary
