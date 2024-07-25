// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IStringCompare, StringCompareProblem} from "src/StringCompareProblem.sol";

contract StringCompareTest is Test {
    IStringCompare private problem;

    function setUp() public {
        problem = new StringCompareProblem();
    }

    function test_StringCompare() public view {
        bool res;
        res = problem.compare("a", "a");
        require(res == true, "wrong result");

        res = problem.compare("a", "b");
        require(res == false, "wrong result");
    }
}
