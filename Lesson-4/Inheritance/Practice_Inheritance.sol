// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Practice: build an inheritance hierarchy with virtual/override and super

contract Animal {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    // virtual – subclasses can override
    function speak() public virtual returns (string memory) {
        return "...";
    }

    function describe() public view returns (string memory) {
        return name;
    }
}

contract Dog is Animal {
    constructor() Animal("Dog") {}

    function speak() public pure override returns (string memory) {
        return "Woof!";
    }
}

contract Cat is Animal {
    constructor() Animal("Cat") {}

    function speak() public pure override returns (string memory) {
        return "Meow!";
    }
}

// Multiple inheritance: combines Ownable behaviour into a contract
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
}

// OwnedDog inherits from both Dog and Ownable (multiple inheritance)
contract OwnedDog is Dog, Ownable {
    // super.speak() resolves to Dog.speak() following C3 linearisation
    function speakAsOwner() external onlyOwner returns (string memory) {
        return super.speak();
    }
}
