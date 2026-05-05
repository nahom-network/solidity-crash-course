// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Practice: define a struct, store it in storage and memory, and update fields
contract Contract {
    struct Person {
        string name;
        uint256 age;
        address wallet;
        bool isActive;
    }

    Person[] public people;
    mapping(address => uint256) private personIndex;
    mapping(address => bool) private registered;

    // Register the caller as a new person
    function register(string calldata name, uint256 age) external {
        require(!registered[msg.sender], "Already registered");

        personIndex[msg.sender] = people.length;
        registered[msg.sender] = true;

        people.push(Person({
            name: name,
            age: age,
            wallet: msg.sender,
            isActive: true
        }));
    }

    // Update age using a storage reference (efficient – no copy)
    function updateAge(uint256 newAge) external {
        require(registered[msg.sender], "Not registered");
        Person storage p = people[personIndex[msg.sender]];
        p.age = newAge;
    }

    // Return a copy of the caller's Person struct from memory
    function getMyProfile() external view returns (Person memory) {
        require(registered[msg.sender], "Not registered");
        return people[personIndex[msg.sender]];
    }

    // Deactivate a person
    function deactivate() external {
        require(registered[msg.sender], "Not registered");
        people[personIndex[msg.sender]].isActive = false;
    }

    function totalPeople() external view returns (uint256) {
        return people.length;
    }
}
