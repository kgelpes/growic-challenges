// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract ConstructorChallengeA {
    address immutable owner = msg.sender;
    uint256 immutable FEE;

    constructor(uint256 _fee) {
        FEE = _fee;
    }
}

contract ConstructorChallengeB is ConstructorChallengeA {
    constructor() ConstructorChallengeA(100) {
        address owner = msg.sender;
    }
}
