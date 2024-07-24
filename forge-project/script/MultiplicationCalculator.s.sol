// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MultiplicationCalculator} from "src/MultiplicationCalculator.sol";

interface IProblem {
    function setMultiplicationCalculator(
        address _multiplicationCalculator
    ) external;
}

contract DeployScript is Script {
    // function setUp() public {}

    function run(address _problem) public {
        IProblem problem = IProblem(_problem);

        vm.startBroadcast();

        // Deploy Target
        MultiplicationCalculator target = new MultiplicationCalculator();

        // Set Target
        problem.setMultiplicationCalculator(address(target));

        vm.stopBroadcast();
    }
}
