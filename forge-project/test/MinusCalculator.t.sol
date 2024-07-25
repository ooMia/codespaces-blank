// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IMinusCalculator, MinusCalculator} from "src/MinusCalculator.sol";

contract MinusCalculatorTest is Test {
    IMinusCalculator private calculator;

    function setUp() public {
        calculator = new MinusCalculator();
    }

    function test_Minus() public view {
        uint256 res = calculator.minus(2, 1);
        require(res == 1, "wrong result");
    }

    function testFuzz_Minus(uint256 input1, uint256 input2) public view {
        // assert input1 > input2
        if (input1 < input2) {
            uint256 temp = input1;
            input1 = input2;
            input2 = temp;
        }
        assert(input1 >= input2);
        try calculator.minus(input1, input2) returns (uint256 res) {
            require(res == input1 - input2, "wrong result");
        } catch Panic(uint256 errorCode) {
            if (errorCode == 0x11) revert();
        }
    }
}
