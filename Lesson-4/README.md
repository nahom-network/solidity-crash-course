# Lesson 4 – Voting Contract & Inheritance

## Topics Covered

### Voting (Build a Voting Contract)
| File | Description |
|------|-------------|
| `Proposal.sol` | Define the `Proposal` struct and `newProposal()` function |
| `Cast_a_Vote.sol` | Add `castVote()` – simple yes/no tally |
| `Multiple_Votes.sol` | Allow voters to change their vote (reverse previous tally) |
| `Members.sol` | Restrict voting and proposals to registered members |
| `Voting_Events.sol` | Emit `ProposalCreated` and `VoteCast` events |
| `Execute.sol` | Auto-execute the proposal when `yesCount >= 10` |
| `Build_Voting_Contract.sol` | Final complete contract with all features + `QUORUM` constant |

### Inheritance
| File | Description |
|------|-------------|
| `Hero.sol` | Base `Hero` abstract contract and `Enemy` interface (shared by other files) |
| `Inherit.sol` | `Mage` and `Warrior` inherit from `Hero` |
| `Virtual_Override.sol` | Demonstrate `virtual` and `override` keywords |
| `Super.sol` | Call the parent implementation with `super.attack()` |
| `Constructor_Args.sol` | Pass arguments to the parent constructor `Hero(50)` |
| `Ownable.sol` | Simple `Ownable` base + `Transferable` child contract |
| `Multiple_Inheritance.sol` | Combining multiple base contracts |
| `Practice_Inheritance.sol` | Practice – `Animal` hierarchy + `OwnedDog` multiple inheritance |

## Key Concepts

- **Governance / Voting pattern**: proposals stored on-chain, members vote, auto-execute at quorum
- **Events**: `emit EventName(args)` – cheap on-chain logs readable off-chain
- **Quorum**: minimum yes-votes needed before a proposal is executed
- **Low-level execution**: `target.call(data)` to execute arbitrary on-chain actions
- **`abstract`**: contract with at least one unimplemented `virtual` function
- **`virtual`**: marks a function as overridable by child contracts
- **`override`**: child contract replaces parent implementation
- **`super`**: calls the next function in the inheritance chain (C3 linearisation)
- **Multiple inheritance**: `contract C is A, B` – Solidity resolves conflicts with C3 ordering
- **Constructor arguments in inheritance**: `contract Mage is Hero(50)` passes value to parent constructor
