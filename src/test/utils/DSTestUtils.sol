// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.11;

import {User} from "./User.sol";
import {Fhevm} from "./Fhevm.sol";
import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

// Common utilities for forge tests on top of solmate DSTestPlus
contract DSTestUtils is DSTestPlus {
    // forge hevm
    Fhevm internal immutable fhevm = Fhevm(HEVM_ADDRESS);

    // Setup prank for the whole test
    modifier prank(address from) {
        fhevm.startPrank(from);
        _;
        fhevm.stopPrank();
    }

    // Create multiple users with 100 ether balance
    function createUsers(uint256 userNum) external returns (address[] memory) {
        address[] memory users = new address[](userNum);
        for (uint256 i = 0; i < 5; i++) {
            User u = new User();
            fhevm.deal(address(u), 100 ether);
            users[i] = address(u);
        }
        return users;
    }

    // Create one user with 100 ether balance
    function createUser() external returns (address) {
        User u = new User();
        fhevm.deal(address(u), 100 ether);
        return address(u);
    }

    // Move block.number forward by a given number of blocks
    function mineBlocks(uint256 numBlocks) external {
        uint256 targetBlock = block.number + numBlocks;
        fhevm.roll(targetBlock);
    }
}
