// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Escrow.sol";

/**
 * @title EscrowTest Contract
 * @dev Comprehensive test suite for the Escrow contract
 * @notice Tests escrow functionality including approval, events, and fund transfers
 */
contract EscrowTest is Test {
    /// @notice The escrow contract instance
    Escrow public escrow;
    
    /// @notice Arbiter who approves the transfer
    address arbiter = address(2);
    
    /// @notice Depositor who initiates the escrow
    address depositor = address(3);
    
    /// @notice Beneficiary who receives the funds
    address payable beneficiary = payable(address(4));
    
    /// @notice Initial escrow amount
    uint constant ESCROW_AMOUNT = 1 ether;

    /**
     * @notice Set up the test environment
     * @dev Creates a new escrow contract with initial funds from depositor
     */
    function setUp() public {
        hoax(depositor, ESCROW_AMOUNT);
        escrow = new Escrow{ value: ESCROW_AMOUNT }(arbiter, beneficiary);
    }

    /**
     * @notice Test that approval emits the correct event
     * @dev Verifies the Approved event is emitted with correct amount
     */
    function testApprovalEvent() public {
        vm.prank(arbiter);
        vm.recordLogs();

        escrow.approve();

        Vm.Log[] memory entries = vm.getRecordedLogs();
        assertEq(entries.length, 1, "Expected exactly one event");
        assertEq(entries[0].topics[0], keccak256("Approved(uint256)"), "Event signature mismatch");
        assertEq(abi.decode(entries[0].data, (uint)), ESCROW_AMOUNT, "Event amount mismatch");
    }
    
    /**
     * @notice Test that only arbiter can approve
     * @dev Verifies that non-arbiter cannot approve the escrow
     */
    function testOnlyArbiterCanApprove() public {
        vm.prank(depositor);
        vm.expectRevert();
        escrow.approve();
    }
    
    /**
     * @notice Test that beneficiary receives funds after approval
     * @dev Verifies funds are transferred correctly to the beneficiary
     */
    function testBeneficiaryReceivesFunds() public {
        uint beneficiaryBalanceBefore = beneficiary.balance;
        
        vm.prank(arbiter);
        escrow.approve();
        
        uint beneficiaryBalanceAfter = beneficiary.balance;
        assertEq(beneficiaryBalanceAfter - beneficiaryBalanceBefore, ESCROW_AMOUNT, "Beneficiary balance incorrect");
    }
}
