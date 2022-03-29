// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Token {
    string public name = "NagaToken";
    string public symbol = "NNT";
    uint public totalsupply = 100000;

    address public owner;

    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalsupply;
        owner = msg.sender;
    }

    function transfer(address to, uint amount) external {
        require(balances[msg.sender] <= amount, "not enought tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceof(address account) external view returns(uint256){
        return balances[account];
    }
}
