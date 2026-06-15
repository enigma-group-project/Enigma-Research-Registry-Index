# Architecture — Enigma-Research-Registry-Index

> Scenario: Research data timestamping and integrity proof: a researcher anchors a dataset hash before peer review to later prove it existed unaltered at time T.

## Roles
- **Issuer** — Journal/Lab (holds the issuer role; creates/updates/revokes DatasetProof records)
- **Owner** — Researcher (controls transfer of their own record)
- **Verifier** — Public/Reviewer (read-only authenticity check)
- **Admin** — deploys, manages issuer roles, links the controller

## System diagram
```
            ┌──────────────────┐
curator ─────▶│  IssuerRegistry  │◀──── isPublisher()/curator() reads
            └──────────────────┘
                     ▲ role check
  issuer ──create──▶ │
            ┌──────────────────┐  controller-only   ┌──────────────┐
            │  RecordRegistry  │◀──────────────────│  AuditTrail  │◀── owner/issuer
            └──────────────────┘  transfer/revoke   └──────────────┘
                     ▲ view
            ┌──────────────────┐
verifier ─▶│   Verification   │
            └──────────────────┘
```

## Workflow (per action)
1. **Register issuer** — curator → `IssuerRegistry.registerPublisher(Journal/Lab)`
2. **Create DatasetProof** — issuer → `RecordRegistry.registerDataset(id, hash, cid, owner, metaURI)` → emits `DatasetRegistered`
3. **Verify** — verifier → `Verification.verifyDataset(id, candidateHash)` → `(valid, status, owner, issuer)`
4. **Transfer** — owner → `AuditTrail.transferDataset(id, newOwner)` → emits `DatasetTransferred`
5. **Revoke / update** — issuer/curator → `AuditTrail.revoke|supersedeVersion(...)`

## On-chain vs off-chain
| On-chain (lean, permanent) | Off-chain (large, private) |
|----------------------------|----------------------------|
| `keccak256(artifact)` hash | the DatasetProof file itself (IPFS) |
| IPFS CID + metadataURI     | the human-readable record.json |
| issuer/owner addresses     | any PII (never on-chain) |
| `issuedAt`, `status`, events | |

## Why blockchain here (and where a DB is fine)
- **Blockchain wins:** tamper-evidence, no single trusted server, public verifiability, issuer can revoke.
- **DB still better for:** search/discovery by name, private lookups, high-frequency mutable data.
> Fill this in with your scenario's concrete argument — it's worth 10 pts (Problem definition).
