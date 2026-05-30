// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "forge-std/Test.sol";
import "../src/StakingToken.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract StakingTokenTest is Test {

  StakingToken stakingToken;
  string name_ = "StakingToken";
  string symbol_ = "STK";
  address ramdonUser = vm.addr(1); 
  
  function setUp() public {
    stakingToken = new StakingToken (name_, symbol_);
  }

  function testStakingTokenMintsCorrectly() public{
    vm.startPrank(ramdonUser);
    uint256 amount_ = 1 ether;

    //TokenBalance Previous
    uint256 balanceBefore_ = IERC20(address(stakingToken)).balanceOf(ramdonUser);

    stakingToken.mint(amount_);
    
    //TokenBalance after
    uint256 balanceAfter_ = IERC20(address(stakingToken)).balanceOf(ramdonUser
    );

    assert(balanceAfter_ - balanceBefore_ == amount_);
    
    vm.stopPrank();
  }
}