// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDivisionCalculator {
    function divide(uint256, uint256) external pure returns (uint256);
}

contract DivisionCalculator is IDivisionCalculator {
    function divide(
        uint256 input1,
        uint256 input2
    ) public pure override returns (uint256) {
        return input1 / input2;
    }
}
