// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PlusCalculator} from "src/PlusCalculator.sol";

interface IProblem {
    function setPlusCalculator(address _plusCalculator) external;
}

contract DeployScript is Script {
    IProblem problem;

    function setUp(address _problem) public {
        problem = IProblem(_problem);
    }

    function run() public {
        vm.startBroadcast();

        // Deploy Target
        PlusCalculator target = new PlusCalculator();

        // Set Target
        problem.setPlusCalculator(address(target));

        vm.stopBroadcast();
    }
}
