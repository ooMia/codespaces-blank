// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IMultiplicationCalculator {
    function multiply(uint256, uint256) external pure returns (uint256);
}

contract MultiplicationCalculator is IMultiplicationCalculator {
    function multiply(
        uint256 input1,
        uint256 input2
    ) public pure override returns (uint256) {
        return input1 * input2;
    }
}
