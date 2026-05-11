// SPDX
pragma solidity 0.8.20;
 
 
contract Escrow { 
    address public depositor; 
    address public beneficiary; 
    address public arbiter; 
    event approved(uint);


    constructor(address arg_arbiter, address arg_beneficiary) 
    payable{ 
        arbiter = arg_arbiter; 
        beneficiary = arg_beneficiary; 
        depositor = msg.sender; 
    } 
    
    function approve() external{ 
        require(msg.sender == arbiter, "Only arbiter can release"); 
        uint256 amount = address(this).balance;
         
        emit approved(amount); 
        (bool success, ) = beneficiary.call{value: amount}(""); 
        require(success, "Transfer failed"); 
        
    } 
}