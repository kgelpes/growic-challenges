// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Events {
    uint256 private constant FEE = 10;

    address owner;
    struct User {
        string name;
        uint256 age;
    }

    mapping (address => uint256) public balances;
    mapping (address => User) public users;

    event FundsDeposited(address indexed user, uint256 amount);
    event ProfileUpdated(address indexed user);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
      require(msg.sender == owner, "Not owner");
      _;
    }

    modifier hasDeposits() {
      require(balances[msg.sender] > 0, "User has no deposits");
      _;
    }

    modifier amountBiggerThanFee(uint256 _amount) {
      require(_amount > FEE, "Amount is too small");
      _;
    }

    function deposit (uint256 _amount) public {
      balances[msg.sender] += _amount;
      emit FundsDeposited(msg.sender, _amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
      users[msg.sender] = User({ name: _name, age: _age });
      emit ProfileUpdated(msg.sender);
    }

    function getUserDetails() public view returns (string memory, uint256) {
      return (users[msg.sender].name, users[msg.sender].age);
    }

    function withdraw() public onlyOwner {
      payable(owner).transfer(address(this).balance);
      // BUG: doesn't reset the values of the balances mapping.
      // Resetting the mapping would require iteration through every address, which would be very expensive.
    }

    function addFunds(uint256 _amount) public hasDeposits amountBiggerThanFee(_amount) {
      balances[msg.sender] += _amount;
      emit FundsDeposited(msg.sender, _amount);
    }
}