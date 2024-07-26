// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SumOfArrayProblem} from "src/SumOfArrayProblem.sol";

interface IProblem {
    function setSumOfArrayContract(address _sumOfArrayContract) external;
}

contract DeployScript is Script {
    // function setUp() public {}

    function run(address _problem) public {
        vm.broadcast();
        // Deploy SumOfArrayProblem
        SumOfArrayProblem target = new SumOfArrayProblem();

        vm.broadcast();
        // Set Target
        IProblem(_problem).setSumOfArrayContract(address(target));
    }
}
