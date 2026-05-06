// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Purchase {
    address payable public seller;
    address payable public buyer;
    uint256 public price;

    enum State {
        Created,
        Locked,
        Inactive
    }

    State public state;

    event Aborted();
    event PurchaseConfirmed(address buyer);
    event ItemReceived();

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this.");
        _;
    }

    modifier inState(State expected) {
        require(state == expected, "Invalid state.");
        _;
    }

    constructor(uint256 itemPrice) {
        seller = payable(msg.sender);
        price = itemPrice;
        state = State.Created;
    }

    function abort() external onlySeller inState(State.Created) {
        state = State.Inactive;
        emit Aborted();
    }

    function confirmPurchase() external payable inState(State.Created) {
        require(msg.value == price, "Exact price required.");
        buyer = payable(msg.sender);
        state = State.Locked;
        emit PurchaseConfirmed(buyer);
    }

    function confirmReceived() external onlyBuyer inState(State.Locked) {
        state = State.Inactive;
        emit ItemReceived();
        seller.transfer(price);
    }
}