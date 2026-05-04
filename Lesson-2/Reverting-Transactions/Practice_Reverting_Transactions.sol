// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Practice: combine require, revert, and modifiers
contract Contract {
    address public owner;
    uint256 public price;
    bool public isOpen;

    constructor(uint256 _price) {
        owner = msg.sender;
        price = _price;
        isOpen = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier shopOpen() {
        require(isOpen, "Shop is closed");
        _;
    }

    function buy() public payable shopOpen {
        require(msg.value == price, "Incorrect ETH amount");
    }

    function setPrice(uint256 _price) public onlyOwner {
        require(_price > 0, "Price must be positive");
        price = _price;
    }

    function toggleShop() public onlyOwner {
        isOpen = !isOpen;
    }

    function withdraw() public onlyOwner {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }
}
