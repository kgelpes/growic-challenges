// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Mappings {
    mapping (address => uint256) public balances;

    function deposit () public payable {
        balances[msg.sender] += msg.value;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}