# Slice 2 — Record Creation (`RecordRegistry.sol`)

> Owner: member2 · Branch: `feature/record-module` · Scenario: Research data timestamping and integrity proof: a researcher anchors a dataset hash before peer review to later prove it existed unaltered at time T.

## What it does
Issues a DatasetProof and stores the on-chain proof (hash + CID + owner + status). The only
contract that mutates state; mutations after creation go through the controller (Slice 4).

## Functions
- `registerDataset(id, dataHash, cid, owner, metadataURI)` — `onlyPublisher`, `nonReentrant`.
- `getRecord(id)` / `exists(id)` — views from `IAttestationRegistry`.
- `setController(address)` — curator links the AuditTrail once.

## Data representation
See `schemas/record.schema.json` (off-chain) and `schemas/attestation-onchain.schema.json` (on-chain).

## Tests (`test/RecordRegistry.t.sol`)
- issuer can create · non-issuer reverts · duplicate reverts.

## TODO checklist
- [ ] `TODO(slice-2)` event-emission test
- [ ] frontend: validate record.json against the schema before issuing
