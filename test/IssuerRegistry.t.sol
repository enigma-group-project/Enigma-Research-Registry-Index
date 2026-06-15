// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {IssuerRegistry} from "../contracts/IssuerRegistry.sol";

/// @notice Slice 1 tests — Issuer Registration.
contract IssuerRegistryTest is Test {
    IssuerRegistry issuers;
    address alice = address(0xA11CE);

    function setUp() public {
        issuers = new IssuerRegistry();
    }

    function test_AdminIsDeployer() public view {
        assertEq(issuers.curator(), address(this));
    }

    function test_RegisterAndRevokeIssuer() public {
        issuers.registerPublisher(alice);
        assertTrue(issuers.isPublisher(alice));
        issuers.deregisterPublisher(alice);
        assertFalse(issuers.isPublisher(alice));
    }

    function test_RevertWhen_NonAdminRegisters() public {
        vm.prank(alice);
        vm.expectRevert(IssuerRegistry.NotCurator.selector);
        issuers.registerPublisher(alice);
    }

    function test_RevertWhen_RegisterZeroAddress() public {
        vm.expectRevert(IssuerRegistry.ZeroAddress.selector);
        issuers.registerPublisher(address(0));
    }
    // TODO(slice-1): add curator-handover test (transferCurator).
}
