# Slice 1 — Issuer Registration (`IssuerRegistry.sol`)

> Owner: member1 · Branch: `feature/issuer-module` · Scenario: Research data timestamping and integrity proof: a researcher anchors a dataset hash before peer review to later prove it existed unaltered at time T.

## What it does
The single source of truth for **who may issue a DatasetProof** and who the curator is.

## Functions
- `registerPublisher(address)` — curator grants the issuer role to a Journal/Lab.
- `deregisterPublisher(address)` — curator revokes it.
- `transferCurator(address)` — hand the curator key to a multisig.
- `isPublisher(address)` / `curator()` — reads used by the other three slices.

## Tests (`test/IssuerRegistry.t.sol`)
- curator is the deployer · register+revoke · non-curator reverts · zero-address reverts.

## TODO checklist
- [ ] `TODO(slice-1)` two-step curator handover
- [ ] event-driven issuer list in the frontend
- [ ] Extension: swap to OpenZeppelin `AccessControl`, note gas delta

## Demo evidence
Screenshot: registering a Journal/Lab and the `PublisherRegistered` event in the trace.
