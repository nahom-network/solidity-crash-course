pragma solidity ^0.8.0;

contract Contract {
    // Def: Struct
    struct User {
        uint256 id;
        string name;
        address wallet;
        bool isActive;
    }

    // initialize a Struct
    User[] public users;

    function addUser(string calldata _name) external {
     
        User memory newUser = User({
            id: users.length,
            name: _name,
            wallet: msg.sender,
            isActive: true
        });

        users.push(newUser);
    }

    mapping(address => User) public userProfile;

    function updateName(string calldata _newName) external {
    
    //create a reference to the storage location
    User storage myProfile = userProfile[msg.sender];
    myProfile.name = _newName; // Directly updates the blockchain
}

}
