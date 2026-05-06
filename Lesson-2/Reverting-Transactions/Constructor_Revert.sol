pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function withdraw() public {
        if (msg.sender != owner) {
            revert("Not owner");
        }

        (bool s, ) = owner.call{value: address(this).balance}("");
        require(s);
    }

    receive() external payable {}
}