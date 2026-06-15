// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title IssuerRegistry — Slice 1 (Publisher Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). Behavior is described in docs/issuer-module.md and
///         locked by test/IssuerRegistry.t.sol — run `forge test` until it is green.
contract IssuerRegistry {
    address public curator;
    mapping(address => bool) public isPublisher;

    event CuratorTransferred(address indexed from, address indexed to);
    event PublisherRegistered(address indexed issuer, address indexed by);
    event PublisherDeregistered(address indexed issuer, address indexed by);

    error NotCurator();
    error ZeroAddress();

    modifier onlyCurator() {
        if (msg.sender != curator) revert NotCurator();
        _;
    }

    constructor() {
        curator = msg.sender;
        emit CuratorTransferred(address(0), msg.sender);
    }

    /// @notice Grant the issuer role. Admin-only; reject zero address; emit PublisherRegistered.
    function registerPublisher(address account) external onlyCurator {
        // TODO(member1): if account == address(0) revert ZeroAddress();
        //               isPublisher[account] = true; emit PublisherRegistered(account, msg.sender);
        revert("TODO(member1): implement registerPublisher");
    }

    /// @notice Revoke the issuer role. Admin-only; emit PublisherDeregistered.
    function deregisterPublisher(address account) external onlyCurator {
        // TODO(member1): isPublisher[account] = false; emit PublisherDeregistered(account, msg.sender);
        revert("TODO(member1): implement deregisterPublisher");
    }

    /// @notice Transfer the curator key. Admin-only; reject zero address; emit CuratorTransferred.
    function transferCurator(address newAdmin) external onlyCurator {
        // TODO(member1): validate newAdmin, emit CuratorTransferred(curator, newAdmin), then curator = newAdmin;
        revert("TODO(member1): implement transferCurator");
    }
}
