// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISumOfArray {
    function sum(uint[] calldata _a) external pure returns (uint);
}

contract SumOfArrayProblem is ISumOfArray {
// contract SumOfArrayProblem {
    function sum(uint[] calldata _a) public pure returns (uint) {
        uint total;

        assembly {
            let data := _a.offset
            let end := add(data, 0x0C80)

            for {

            } lt(data, end) {
                data := add(data, 0x20)
            } {
                total := add(total, calldataload(data))
            }
        }
        return total;
    }
}
