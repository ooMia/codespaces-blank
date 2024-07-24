// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DivisionCalculator} from "src/DivisionCalculator.sol";

interface IProblem {
    function setDivisionCalculator(address _DivisionCalculator) external;
}

contract DeployScript is Script {
    // function setUp() public {}

    function run(address _problem) public {
        IProblem problem = IProblem(_problem);

        vm.startBroadcast();

        // Deploy Target
        DivisionCalculator target = new DivisionCalculator();

        // Set Target
        problem.setDivisionCalculator(address(target));

        vm.stopBroadcast();
    }
}
