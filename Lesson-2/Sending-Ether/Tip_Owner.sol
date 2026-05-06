pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    function tip() public payable {
        (bool s, ) = owner.call{value: msg.value}("");
        require(s);
    }

    receive() external payable {}

    function donate() public {
        selfdestruct(payable(charity));
    }
}