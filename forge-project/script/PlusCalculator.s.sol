// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PlusCalculator} from "src/PlusCalculator.sol";

contract PlusCalculatorScript is Script {
    function setUp() public {}

    function run(address level) public {
        vm.startBroadcast();

        PlusCalculator calculator = new PlusCalculator(level);

        vm.stopBroadcast();
    }
}
