// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/05Token.sol";

contract TokenTest is Test {
    address tokenContractAddress = 0xc820ccFfB644416eb3C5C9DD92D8D927B768d585;
    IToken public token = IToken(tokenContractAddress);
    hackToken public tokenhack = new hackToken(tokenContractAddress);
    address bob = address(0xe16Bd85C59f7A75350350676D798A1C193F9e7f0);

    function testHack() public {
        uint256 balanceOrigin = token.balanceOf(bob);
        console.log(balanceOrigin);
        tokenhack.hack();
        console.log(token.balanceOf(bob));
        assertEq(token.balanceOf(bob), 21000020);
    }
}
