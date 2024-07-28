// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

import "forge-std/Test.sol";

contract MyConsoleTest is Test {
    bytes private ans2;

    function setUp() public {
        ans2 = abi.encodeWithSignature(
            "giveMeFlag(uint256)",
            1,
            hex"2304e88f144ae9318c71b0fb9e0f44bd9e0c6c58fb1b5315a35fd8b4b2a444ab"
        );
    }

    function test_giveMeFlag(
        uint ans1 //, bytes calldata ans2
    ) external view {
        console.logAddress(msg.sender);
        console.logAddress(tx.origin);

        console.logUint(ans1);
        console.logBytes(ans2);

        string[6] memory keccakToBe = [
            hex"32cefdcd8e794145c9af8dd1f4b1fbd92d6e547ae855553080fc8bd19c4883a0",
            hex"2304e88f144ae9318c71b0fb9e0f44bd9e0c6c58fb1b5315a35fd8b4b2a444ab",
            hex"60a73bfb121a98fb6b52dfb29eb0defd76b60065b8cf07902baf28c167d24daf",
            hex"ea00237ef11bd9615a3b6d2629f2c6259d67b19bb94947a1bd739bae3415141c",
            hex"f1918e8562236eb17adc8502332f4c9c82bc14e19bfc0aa10ab674ff75b3d2f3",
            hex"a8982c89d80987fb9a510e25981ee9170206be21af3c8e0eb312ef1d3382e761"
        ];

        for (uint i = 0; i < keccakToBe.length; i++) {
            console.logBytes1(ans2[i]);
        }
    }
}
