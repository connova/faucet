
// SPDX-License-Identifer: MIT

pragma solidity >0.5.0 <0.6.0;

contract Faucet {

    event Withdrawal(address indexed to, uint256 amount);
    event Deposit(address indexed from, uint256 amount);

    // give out ether to anyone who asks
    function withdraw(uint256 withdraw_amount) public {
        // check for sufficient funds
        require (withdraw_amount < 0.1 ether, "Maximum withdrawal amount is 0.1 ether");
        require(address(this).balance >= withdraw_amount, "Faucet: Insufficient balance for withdrawal request");
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    function () external payable {
        emit Deposit(msg.sender, msg.value);
    }
}