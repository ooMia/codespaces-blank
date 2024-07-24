// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MinusCalculator} from "src/MinusCalculator.sol";

interface IProblem {
    function setMinusCalculator(address _minusCalculator) external;
}

contract DeployScript is Script {
    function setUp() public {}

    function run(address _problem) public {
        IProblem problem = IProblem(_problem);

        vm.startBroadcast();

        // Deploy Target
        MinusCalculator target = new MinusCalculator();

        // Set Target
        problem.setMinusCalculator(address(target));

        vm.stopBroadcast();
    }
}
