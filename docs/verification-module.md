# Slice 3 — Verification (`Verification.sol`)

> Owner: member3 · Branch: `feature/verification-module` · Scenario: Research data timestamping and integrity proof: a researcher anchors a dataset hash before peer review to later prove it existed unaltered at time T.

## What it does
The zero-gas read path a Public/Reviewer uses to confirm a DatasetProof is authentic, active, and who owns it.

## Functions
- `verifyDataset(id, candidateHash)` → `(valid, status, owner, issuer)`
- `verifyDatasetHash` · `statusOf` · `ownerOf`

## Demo script
1. Issue a DatasetProof (Slice 2).
2. Re-hash the same artifact in the Verification page → ✅ VALID.
3. Revoke it (Slice 4) → re-verify → status `Revoked`, valid=false.

## Tests (`test/Verification.t.sol`)
- hash match · wrong hash fails · verifyDataset active.

## TODO checklist
- [ ] `TODO(slice-3)` assert valid=false after revoke
- [ ] in-browser IPFS fetch + re-hash
