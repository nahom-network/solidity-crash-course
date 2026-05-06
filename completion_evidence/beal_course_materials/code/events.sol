// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

event BidRaised(address bidder, uint256 amount);

contract Bidding {
    address public highestBidder;
    uint256 public highestBid;

    function bid() external payable {
        require(msg.value > highestBid, "Bid too low");
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit BidRaised(msg.sender, msg.value);
    }
}