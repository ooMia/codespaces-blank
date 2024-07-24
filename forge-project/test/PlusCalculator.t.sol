// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PlusCalculator} from "src/PlusCalculator.sol";

contract PlusCalculatorTest is Test {
    PlusCalculator private calculator;

    function setUp() public {
        calculator = new PlusCalculator();
    }

    function test_Plus() public view {
        uint256 res = calculator.plus(1, 2);
        require(res == 3, "wrong result");
    }

    function testFuzz_Plus(uint256 input1, uint256 input2) public view {
        try calculator.plus(input1, input2) returns (uint256 res) {
            require(res == input1 + input2, "wrong result");
        } catch {
            // allow overflow panic
        }
    }
}
