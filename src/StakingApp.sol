// SPDX-License-Identifier: MIT

pragma solidity ^0.8.34;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

//Staking fixed amount. 
//Staking Reward period. 

contract StakingApp is Ownable {
    // Variables
    address public StakingToken;
    uint256 public stakingPeriod;
    uint256 public fixedStakingAmount; 
    mapping(address => uint256) public userBalance;

    //Events

    event ChangeStakingPeriod(uint256 newStakingPeriod_); 
    event DepositTokens(address userAddress_, uint256 depositAmount_);

    constructor(address stakingToken_, address owner_, uint256 stakingPeriod_, uint256 fixedStakingAmount_) Ownable(owner_){
        StakingToken = stakingToken_;
        stakingPeriod = stakingPeriod_;
        fixedStakingAmount = fixedStakingAmount_;  
    }

    //Functions external 
        //1 Deposit Tokens

            function depositTokens(uint256 tokenAmountToDeposit_) external{
                require (tokenAmountToDeposit_ == fixedStakingAmount, "Incorrect amount");
                require (userBalance[msg.sender] == 0, "User already deposited");
                
                IERC20(StakingToken).transferFrom(msg.sender, address(this), tokenAmountToDeposit_);
                userBalance[msg.sender] += tokenAmountToDeposit_; 

                emit DepositTokens(msg.sender, tokenAmountToDeposit_); 
            } 
        //2 Withdraw Tokens
        //3 Claim Rewards

    //Functions internal




    function changeStakingPeriod(uint256 newStakingPeriod_) external onlyOwner {
        stakingPeriod = newStakingPeriod_;
        emit ChangeStakingPeriod(newStakingPeriod_);
    }
}
