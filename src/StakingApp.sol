// SPDX-License-Identifier: MIT

pragma solidity ^0.8.34;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract StakingApp is Ownable {
    // Variables
    address public StakingToken;

    constructor(address stakingToken_, address owner_) Ownable(owner_){
        StakingToken = stakingToken_;
    }
}
