// SPDX-License-Identifier: Unlicence
pragma solidity 0.8.11;

// Payable user contract
contract User {
    fallback() external payable {}
}
