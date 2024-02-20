// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FriendTech is ERC20, AccessControl {
    bytes32 public constant OWNER_ROLE = keccak256("OWNER_ROLE");

    mapping(address => uint256) private sharePrice;
    mapping(address => uint256) public totalShares;

    constructor() ERC20("FriendTech", "FTK") {
        _setupRole(OWNER_ROLE, msg.sender);
    }

    function setSharePrice(uint256 price) external {
        require(hasRole(OWNER_ROLE, msg.sender), "Caller is not the owner");
        require(price > 0, "Price must be greater than zero");
        sharePrice[msg.sender] = price;
    }

    function getSharePrice(address user) public view returns (uint256) {
        return sharePrice[user];
    }

    function setTotalShares(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        totalShares[msg.sender] = amount;
    }

    function getTotalShares(address user) public view returns (uint256) {
        return totalShares[user];
    }

    function buyShares(address seller, uint256 amount) external payable {
        // Function remains unchanged for simplicity
    }

    function sellShares(address buyer, uint256 amount) external {
        // Function remains unchanged for simplicity
    }

    function transferShares(address to, uint256 amount) external {
        // Function remains unchanged for simplicity
    }
}