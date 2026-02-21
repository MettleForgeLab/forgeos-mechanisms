# forgeos-mechanisms

**Layer:** mechanisms  
**Scope:** Content-free control engines + contracts for ForgeOS (routing, scalar regulation contracts, envelope logic, boundary/pacing/tone, scroll validation/compile/load interfaces, ritual→FSM conversion interfaces, role/domain binding interfaces).  
**Non-scope:** No domain/role/ritual/atlas bundles. No UI. No deployment scripts. No runtime orchestration.

Mechanisms compute control behavior under governance contracts.  
They do not host content and do not run the system.

## Hard boundaries (non-negotiable)

Mechanisms MUST NOT:

- contain any ROLE/DOMAIN/RITUAL/ATLAS content bundles
- read runtime logs/UI state/persistent stores as implicit control inputs
- introduce or redefine invariants (ForgeEcosystem is authoritative)
- bypass ARIA membrane rules
- depend on transient perf metrics (latency/throughput) for routing unless explicitly declared and logged

Mechanisms MUST:

- be deterministic under identical inputs (config hash, seed, admitted telemetry, model versions)
- produce hash-stable artifacts for validation/compile/load surfaces
- export explicit schemas/contracts consumed downstream

## Determinism posture

- Artifact determinism (compile/validate/load) is mandatory in-repo.
- Control-plane determinism is mandatory system-wide (routing + gating + hashes).
- Token sampling determinism is out of scope.

## Dependencies

**Upstream:** ForgeEcosystem, ConditionalBoundedness, ARIA-Regulation-Layer, BoundedRuntime  
**Downstream:** chest-engine, forge-domains, laforge-ops-verification

Governance defines. Mechanisms compute. Domains declare. Chest orchestrates. Ops verifies.
