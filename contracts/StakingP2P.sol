// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract StakingContract {
    P2PToken public token;
    uint256 public stakingBalance;
    uint256 public stakingDuration;
    uint256 public rewardRate;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;

    // mapping(address => uint256) public 
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;

    constructor(address _token, uint256 _stakingDurationDays, uint256 _apyPercent) {
        token = P2PToken(_token);
        stakingDuration = _stakingDurationDays * 1 days;
        rewardRate = token.totalSupply() * _apyPercent / (365 * 100 * stakingDuration);
        lastUpdateTime = block.timestamp;
        rewardPerTokenStored = 0;
    }

    function stake(uint256 amount) external payable {
        require(amount > 0, "Cannot stake 0 tokens");
        updateReward(msg.sender);
        token.transferFrom(msg.sender, address(this), amount);
        stakingBalance += amount;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Cannot withdraw 0 tokens");
        require(block.timestamp >= lastUpdateTime + stakingDuration, "Staking period not over yet");
        updateReward(msg.sender);
        token.transfer(msg.sender, amount);
        token.mint(msg.sender, (7 * amount) / 800);
        stakingBalance -= amount;
    }

    function withdrawTest(uint256 amount) external {
        require(amount > 0, "Cannot withdraw 0 tokens");
        // require(block.timestamp >= lastUpdateTime + stakingDuration, "Staking period not over yet");
        updateReward(msg.sender);
        token.transfer(msg.sender, amount);
        token.mint(msg.sender, (7 * amount) / 800);
        stakingBalance -= amount;
    }

    function claimReward() external {
        updateReward(msg.sender);
        uint256 reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            token.transfer(msg.sender, reward);
        }
    }

    function updateReward(address account) internal {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = lastTimeRewardApplicable();
        if (account != address(0)) {
            rewards[account] = earned(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
    }

    function lastTimeRewardApplicable() internal view returns (uint256) {
        return block.timestamp < lastUpdateTime ? lastUpdateTime : block.timestamp;
    }

    function rewardPerToken() internal view returns (uint256) {
        if (stakingBalance == 0) {
            return rewardPerTokenStored;
        }
        return rewardPerTokenStored + (lastTimeRewardApplicable() - lastUpdateTime) * rewardRate * 1e18 / stakingBalance;
    }

    function earned(address account) public view returns (uint256) {
        return (stakingBalance * (rewardPerToken() - userRewardPerTokenPaid[account]) / 1e18) + rewards[account];
    }
}