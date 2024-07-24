// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IDivisionCalculator, DivisionCalculator} from "src/DivisionCalculator.sol";

contract DivisionCalculatorTest is Test {
    IDivisionCalculator private calculator;

    function setUp() public {
        calculator = new DivisionCalculator();
    }

    function test_Division() public view {
        uint256 res;

        res = calculator.divide(14, 7);
        require(res == 2, "Division#1");

        res = calculator.divide(0, 7);
        require(res == 0, "Division#2");

        res = calculator.divide(3, 2);
        require(res == 1, "Division#3");
    }

    function testFuzz_Division(uint256 input1, uint256 input2) public view {
        if (input2 == 0) {
            return;
        } else if (input1 == 0) {
            require(calculator.divide(input1, input2) == 0, "Fuzz_Division#1");
        }
        try calculator.divide(input1, input2) returns (uint256 res) {
            require(res == input1 / input2, "Fuzz_Division#2");
        } catch Panic(uint256 errorCode) {
            if (errorCode != 0x11) {
                revert("Fuzz_Division#3");
            }
        }
    }

    function testFuzz_SingularDivision(uint256 input) public view {
        if (input == 0 || input == 1) {
            return;
        }
        require(
            calculator.divide(input, input) == 1,
            "Fuzz_SingularDivision#1"
        );
        try calculator.divide(input + 1, input) returns (uint256 res) {
            require(res == 1, "Fuzz_Division#2");
        } catch Panic(uint256 errorCode) {
            // allow underflow panic
            if (errorCode != 0x11) {
                revert("Fuzz_Division#3");
            }
        }

        try calculator.divide(input, input + 1) returns (uint256 res) {
            require(res == 0, "Fuzz_Division#4");
        } catch Panic(uint256 errorCode) {
            // allow underflow panic
            if (errorCode != 0x11) {
                revert("Fuzz_Division#5");
            }
        }
    }
}
