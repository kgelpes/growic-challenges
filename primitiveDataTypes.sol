// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract PrimitiveDatatypes {
    // Booleans: true or false, when only two options are possible
    bool public isComplete = false;

    // Integers: whole numbers, can be signed or unsigned
    int public balance = -10; // signed, can be positive or negative. Alias for int256. Use case: debts, balances
    uint public quantity = 1; // unsigned, can only be positive. Alias for int256. Use case: quantities
    uint8 public smallQuantity = 8; // unsigned, can only be positive. The 8 means 8 bits, so the number can range from 0 to 255. Use case: small quantities

    // Addresses: 20 bytes, used to store Ethereum addresses
    address public myAddress = 0x0000000000000000000000000000000000000000; // this is the default value for an address

    // Enums: enumeration, assigns an unsigned unique integer to each listed value. This helps with readability and prevents typos
    enum State { Idle, Loading, Success, Error } // These values will be assigned 0, 1, 2 and 3 respectively. For example, State.Loading will be 1.

    // Bytes: sequence of bytes, can be fixed or dynamic. Fixed bytes are more efficient and can go up to 32 bytes
    bytes1 public myBytes = "a" // 1 byte. Use case: storing a single character, it is more efficient than a string because it will always be 1 byte
}