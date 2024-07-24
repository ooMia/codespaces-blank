// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IMultiplicationCalculator, MultiplicationCalculator} from "src/MultiplicationCalculator.sol";

contract MultiplicationCalculatorTest is Test {
    IMultiplicationCalculator private calculator;

    function setUp() public {
        calculator = new MultiplicationCalculator();
    }

    function test_Multiplication() public view {
        uint256 res = calculator.multiply(3, 7);
        require(res == 21, "wrong result");
    }

    function testFuzz_Multiplication(
        uint256 input1,
        uint256 input2
    ) public view {
        try calculator.multiply(input1, input2) returns (uint256 res) {
            require(res == input1 * input2, "wrong result");
        } catch {
            // allow overflow panic
        }
    }
}
