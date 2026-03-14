
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./VaultStorage.sol";

contract RewardDistributor is VaultStorage {

    uint256 public rewardPerShare;

    function distribute(uint256 reward) public {

        require(totalShares > 0, "No shares");

        rewardPerShare += reward / totalShares;

        for(uint256 i = 0; i < userList.length; i++){

            address userAddr = userList[i];

            users[userAddr].rewardDebt =
                users[userAddr].shares * rewardPerShare;
        }
    }
}
