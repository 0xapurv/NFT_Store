// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.16;

contract Investment {
    // amount returned to user
    int256 balanceAmount;
    // amount deposited by user
    int256 depositAmount;
    // minimum amount to be deposited by user
    int256 thresholdAmount;
    // amount to be returned in addition to depositAmount to user
    int256 returnOnInvestment;

    constructor() public {
        balanceAmount = 0;
        depositAmount = 0;
        thresholdAmount = 12;
        returnOnInvestment = 3;
    }

    // read operation
    function getBalanceAmount() public view returns (int256) {
        return balanceAmount;
    }

    // read operation
    function getDepositAmount() public view returns (int256) {
        return depositAmount;
    }

    // write operation
    function addDepositAmount(int256 amount) public {
        depositAmount = depositAmount + amount;

        if (depositAmount >= thresholdAmount) {
            balanceAmount = depositAmount + returnOnInvestment;
        }
    }

    // write function
    function withdrawBalance() public {
        balanceAmount = 0;
        depositAmount = 0;
    }
}
