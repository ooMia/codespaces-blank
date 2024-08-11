// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILevelInterface {
    function giveMeFlag(uint, bytes calldata) external;
}

contract Solve {
    constructor(address target) {
        ILevelInterface(target).giveMeFlag(31337, hex"757073696465");
    }
}
