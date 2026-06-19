// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {IAttestationRegistry} from "./interfaces/IAttestationRegistry.sol";
import {RecordRegistry} from "./RecordRegistry.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
/// @title AuditTrail — Slice 4 (Transfer / Revocation / Versioning / Provenance)  [STUDENT TEMPLATE]
contract AuditTrail is ReentrancyGuard {
    RecordRegistry public immutable registry;
    event DatasetTransferred(bytes32 indexed id, address indexed from, address indexed to, uint64 at);
    event DatasetRevoked(bytes32 indexed id, address indexed by, string reason, uint64 at);
    event VersionSuperseded(bytes32 indexed id, bytes32 newHash, string newCid, uint64 at);
    event ProvenanceLogged(bytes32 indexed id, address indexed by, string note, uint64 at);
    error NotOwner(); error NotPublisherOrCurator(); error Missing();
    constructor(address recordRegistry) { registry = RecordRegistry(recordRegistry); }
    function transferDataset(bytes32 id, address newOwner) external nonReentrant { revert("TODO(member4): implement transferDataset"); }
    function revokeDataset(bytes32 id, string calldata reason) external nonReentrant { revert("TODO(member4): implement revokeDataset"); }
    function supersedeVersion(bytes32 id, bytes32 newHash, string calldata newCid) external nonReentrant { revert("TODO(member4): implement supersedeVersion"); }
    function logProvenance(bytes32 id, string calldata note) external { revert("TODO(member4): implement logProvenance"); }
}
