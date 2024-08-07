// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IPlusCalculator {
    function plus(uint256, uint256) external pure returns (uint256);
}

contract PlusCalculator is IPlusCalculator {
    function plus(
        uint256 input1,
        uint256 input2
    ) public pure override returns (uint256) {
        return input1 + input2;
    }
}
