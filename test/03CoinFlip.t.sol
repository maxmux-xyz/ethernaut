// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/03CoinFlip.sol";

contract CoinFlipTest is Test {
    address cfAddress = 0xF833B274Ad3E6a08fa4873C6d5dCD1EE0965cb65;
    CoinFlip cf = CoinFlip(cfAddress);
    address bob = address(0x1);
    HackCoinFlip hackcf = new HackCoinFlip(address(cfAddress));

    function setUp() public {
        (bool success,) = payable(address(bob)).call{value: 2 ether}("");
        require(success, "Transfer to bob failed.");
    }

    function testHack() public {
        uint256 wins = cf.consecutiveWins();
        hackcf.hack();
        uint256 newWins = cf.consecutiveWins();
        assertEq(wins + 1, newWins);
    }
}
