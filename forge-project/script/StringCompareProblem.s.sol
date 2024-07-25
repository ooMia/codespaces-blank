// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {StringCompareProblem} from "src/StringCompareProblem.sol";

interface IProblem {
    function setStringCompareContract(address _stringCompareContract) external;
}

contract DeployScript is Script {
    // function setUp() public {}

    function run(address _problem) public {
        IProblem problem = IProblem(_problem);

        vm.startBroadcast();

        // Deploy Target
        StringCompareProblem target = new StringCompareProblem();

        // Set Target
        problem.setStringCompareContract(address(target));

        vm.stopBroadcast();
    }
}
