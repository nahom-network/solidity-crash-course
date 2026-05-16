# Address Interactions

Welcome to the **Address Interactions** module! This section of the Solidity Crash Course focuses on how smart contracts interact with accounts, addresses, and other contracts on the Ethereum blockchain.

Understanding how to securely send and receive Ether, communicate with other contracts, and handle errors are fundamental skills for any smart contract developer.

## Module Contents

This folder contains the following sub-topics, each containing its own lessons and practices:

### 1. Calling Contracts
Learn how to communicate with other smart contracts by sending transactions.
* **Concepts Covered:** Calldata, function selectors (`keccak256`), low-level calls, and understanding the `data` property of a transaction.
* **Directory:** `Calling Contracts/Practice Calldata`

### 2. Escrow
Build a real-world application of address interactions by creating an Escrow contract.
* **Concepts Covered:** Holding funds in escrow, third-party arbitration, approving transfers, and practical use cases like real estate and marketplaces.
* **Directory:** `Escrow/Build an Escrow`

### 3. Reverting Transactions
Learn how to handle errors and ensure your contract state remains consistent.
* **Concepts Covered:** Halting execution, rolling back state changes, refunding gas, and the three main ways to express errors in Solidity (`assert`, `require`, `revert`).
* **Directory:** `Reverting Transactions/Practice Reverting Transactions`

### 4. Sending Ether
Understand the mechanics of sending and receiving Ether between Externally Owned Accounts (EOAs) and Contract Accounts.
* **Concepts Covered:** `msg.sender`, `msg.value`, roles, permissions, tracking balances, and the differences between EOAs and Contract Accounts.
* **Directory:** `Sending Ether/Practice Sending Ether`

## Getting Started

Navigate to any of the subdirectories and read their respective `README.md` files to begin the lessons and practice exercises. Each practice folder contains a Foundry setup with `contracts` to modify and `tests` to verify your solutions.
