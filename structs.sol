// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Structs {
    struct User {
        string name;
        uint256 age;
    }

    mapping (address => uint256) public balances;
    mapping (address => User) public users;

    function deposit (uint256 amount) public payable {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function setUserDetails(string calldata name, uint256 age) public {
      users[msg.sender] = User({ name: name, age: age });
    }

    function getUserDetails() public view returns (string memory, uint256) {
      return (users[msg.sender].name, users[msg.sender].age);
    }
}