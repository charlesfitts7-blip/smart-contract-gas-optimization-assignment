
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VaultStorage {

    struct UserInfo {
        uint256 shares;
        uint256 rewardDebt;
        uint256 depositTime;
    }

    mapping(address => UserInfo) public users;

    address[] public userList;

    uint256 public totalShares;
    uint256 public totalDeposits;
}
