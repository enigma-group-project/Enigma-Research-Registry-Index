// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IAttestationRegistry} from "./interfaces/IAttestationRegistry.sol";
import {RecordRegistry} from "./RecordRegistry.sol";

/// @title AuditTrail — Slice 4 (Transfer / Revocation / Audit)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member4). Spec: docs/audit-module.md + test/AuditTrail.t.sol.
contract AuditTrail {
    RecordRegistry public immutable registry;

    event DatasetTransferred(bytes32 indexed id, address indexed from, address indexed to, uint64 at);
    event DatasetRevoked(bytes32 indexed id, address indexed by, string reason, uint64 at);
    event VersionSuperseded(bytes32 indexed id, bytes32 newHash, string newCid, uint64 at);
    event ProvenanceLogged(bytes32 indexed id, address indexed by, string note, uint64 at);

    error NotOwner();
    error NotPublisherOrCurator();
    error Missing();

    constructor(address recordRegistry) { registry = RecordRegistry(recordRegistry); }

    /// @notice Current owner transfers the record to a new owner.
    function transferDataset(bytes32 id, address newOwner) external {
        // TODO(member4): read record; require it exists (else Missing) and msg.sender == owner (else NotOwner);
        //               registry.controllerTransfer(id, newOwner); emit DatasetTransferred.
        revert("TODO(member4): implement transferDataset");
    }
    /// @notice Issuer or curator revokes the record.
    function revokeDataset(bytes32 id, string calldata reason) external {
        // TODO(member4): require exists; require msg.sender == issuer || registry.issuers().curator();
        //               registry.controllerRevoke(id, msg.sender); emit Revoked.
        revert("TODO(member4): implement revoke");
    }
    /// @notice Issuer supersedes the record with a new hash/CID.
    function supersedeVersion(bytes32 id, bytes32 newHash, string calldata newCid) external {
        // TODO(member4): same authz as revoke; registry.controllerUpdate(...); emit Updated.
        revert("TODO(member4): implement update");
    }
    /// @notice Anyone can drop a checkpoint into the audit log.
    function logProvenance(bytes32 id, string calldata note) external {
        // TODO(member4): emit ProvenanceLogged(id, msg.sender, note, uint64(block.timestamp));
        revert("TODO(member4): implement logProvenance");
    }
}
