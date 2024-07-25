// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStringCompare {
    function compare(
        string memory _a,
        string memory _b
    ) external pure returns (bool);
}

contract StringCompareProblem is IStringCompare {
    function compare(
        string memory _a,
        string memory _b
    ) public pure override returns (bool) {
        return
            keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }
}
