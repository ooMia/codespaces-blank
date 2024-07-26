// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ISumOfArray, SumOfArrayProblem} from "src/SumOfArrayProblem.sol";

contract StringCompareTest is Test {
    ISumOfArray private problem;

    function setUp() public {
        problem = new SumOfArrayProblem();
    }

    function test_StringCompare() public view {
        uint[] memory a = new uint[](3);
        a[0] = 1;
        a[1] = 2;
        a[2] = 3;
        require(problem.sum(a) == 6, "wrong result");

        uint[] memory b = new uint[](4);
        b[0] = 1;
        b[1] = 2;
        b[2] = 3;
        b[3] = 4;
        require(problem.sum(b) == 10, "wrong result");
    }

    function test_LargeArray() public view {
        unchecked {
            uint[] memory largeArray = new uint[](100);
            for (uint i = 0; i < 100; i++) {
                largeArray[i] = i + 1; // 1부터 100까지의 값 할당
            }
            require(
                problem.sum(largeArray) == 5050,
                "wrong result for large array"
            );
        }
    }
}
