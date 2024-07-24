// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PlusCalculator} from "src/PlusCalculator.sol";

interface IProblem {
    function setPlusCalculator(address _plusCalculator) external;
}

contract DeployScript is Script {
    // function setUp() public {}

    function run(address _problem) public {
        IProblem problem = IProblem(_problem);

        vm.startBroadcast();

        // Deploy Target
        PlusCalculator target = new PlusCalculator();

        // Set Target
        problem.setPlusCalculator(address(target));

        vm.stopBroadcast();
    }
}
