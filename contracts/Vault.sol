
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./VaultStorage.sol";
import "./interfaces/IVault.sol";

contract Vault is VaultStorage, IVault {

    uint256 public rewardPerShare;

    event Deposit(address user, uint256 amount);
    event Withdraw(address user, uint256 amount);

    function deposit() external payable {

        require(msg.value > 0, "Deposit must be greater than zero");

        UserInfo storage user = users[msg.sender];

        if(user.shares == 0) {
            userList.push(msg.sender);
        }

        uint256 shares = msg.value;

        user.shares += shares;

        totalShares += shares;

        totalDeposits += msg.value;

        user.depositTime = block.timestamp;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 shares) external {

        UserInfo storage user = users[msg.sender];

        require(user.shares >= shares, "Not enough shares");

        uint256 amount = shares;

        user.shares -= shares;

        totalShares -= shares;

        payable(msg.sender).transfer(amount);

        emit Withdraw(msg.sender, amount);
    }

    function pendingRewards(address userAddr) public view returns(uint256){

        UserInfo memory user = users[userAddr];

        uint256 accumulated = user.shares * rewardPerShare;

        return accumulated - user.rewardDebt;
    }

}
