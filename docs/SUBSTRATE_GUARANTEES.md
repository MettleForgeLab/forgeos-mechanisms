MINIMUM\_LAFORGE\_SUBSTRATE\_GUARANTEES\_FOR\_ARIA\_HOSTING\_v1.0



Status: Normative

Applies To: Any LaForge node hosting ARIA-regulated control execution

Layer: Substrate enforcement contract



0\. Purpose



This document defines the minimum substrate guarantees required for ARIA-compliant control execution.



It ensures:



bounded event membranes



deterministic control-plane behavior



seed discipline



configuration freeze



persistence quarantine



replay-verifiable execution



This document defines enforcement constraints — not gain logic, switching logic, or model internals.



1\. Definitions

1.1 Decode Start



Decode start SHALL be defined as the first token emission from the selected model(s), not the invocation call.



1.2 Atomic Commit



Atomic commit SHALL mean a write operation that is:



indivisible



fully persisted or not persisted at all



idempotent



write-once for a given unique event identifier



Partial, multi-phase, or staged commit records are prohibited.



1.3 Event Membrane



The event membrane SHALL span from:



Decode Start → Atomic Commit record write (inclusive)



The commit record write SHALL be the terminal action of the event membrane.



No control evaluation SHALL occur after commit.



1.4 Control Parameters



Control parameters include, at minimum:



gain



readiness thresholds



routing decision



configuration snapshot



parameter block hash



seed



model selection



gating variables



2\. Event Membrane Enforcement



Decode start SHALL define the membrane boundary.



No control parameter mutation SHALL occur after decode start.



Exactly one atomic commit SHALL occur per event.



Commit SHALL be idempotent and write-once.



No post-commit control mutation SHALL occur.



3\. Pre-Decode Configuration Freeze



Configuration snapshot SHALL be resolved, hashed, and frozen prior to decode start.



Configuration SHALL NOT mutate during event execution.



Configuration hash SHALL be included in the commit record.



Any derived configuration values SHALL be included in the parameter block hash.



4\. Seed Governance



Seed SHALL be explicitly declared.



Seed SHALL be version-pinned.



Seed SHALL be logged at commit.



Seed SHALL NOT be time-derived unless explicitly declared and logged.



Seed SHALL NOT mutate during event execution.



Any seed derivation function SHALL be declared and versioned.



5\. Deterministic Telemetry Discipline



Telemetry used in readiness computation SHALL be deterministic under identical input and configuration.



Identical input SHALL include:



input text



configuration hash



parameter block hash



seed



model versions



Wall-clock sampling SHALL NOT feed readiness unless normalized and logged.



Control computation SHALL NOT reference system time during event execution unless declared and versioned.



Non-deterministic telemetry SHALL be classified and excluded from readiness unless declared non-binding.



6\. Persistence Quarantine



Persistent stores (SQLite, logs, unified state objects, caches) SHALL NOT influence readiness, gain, or routing unless treated as explicit deterministic event artifacts.



Any admitted persistent artifact MUST:



be version-pinned



have a hash logged at commit



Readiness (A) and gain (G) MUST NOT be inherited across events.



7\. No Concurrent Mutation



No shared mutable control state across threads or async loops during event execution.



No concurrent mutation of control parameters during decode.



Control parameter reads SHALL occur from immutable snapshot objects.



All control computation SHALL occur in deterministic pre-decode phase.



8\. Routing Determinism



Routing logic SHALL be deterministic under identical input/configuration/seed.



Routing decision SHALL be resolved prior to decode start.



Routing inputs SHALL be logged at commit.



No model SHALL read another model’s internal scalar state.



Routing SHALL NOT be influenced by transient runtime metrics (latency, throughput) unless declared and logged in configuration snapshot.



9\. Commit Logging Minimum



Each commit record SHALL include:



Unique event identifier (globally unique, non-reusable)



Timestamp (UTC)



Model identifiers + immutable build/version hash



Configuration hash



Parameter block hash



Seed



Final gating parameters (resolved pre-decode)



Telemetry sources used (with hashes where applicable)



Routing decision (if any)



Commit record SHALL be cryptographically hashable and reproducible.



10\. Escalation Binding



Any membrane violation SHALL trigger governance escalation.



Replay mismatch beyond tolerance SHALL escalate to Level 3 or above.



Undeclared parameter mutation SHALL escalate to Level 5 (Hard Halt).



Escalation events SHALL be logged as governance artifacts.



11\. Deterministic Replay Requirement



Given identical:



input text



configuration hash



parameter block hash



seed



model versions



The system SHALL reproduce:



identical routing decision



identical gating parameters



identical commit metadata



Token output MAY vary due to probabilistic sampling; such variation is outside control determinism scope.



12\. Substrate Boundary Clause



The substrate:



MAY host models



MAY provide container orchestration



MAY provide GPU resources



The substrate SHALL NOT:



alter control-plane logic



inject hidden configuration



mutate control parameters mid-event



bypass event membrane enforcement



Substrate hosting is conditional on adherence to this contract.



13\. Compliance Condition



A LaForge node SHALL NOT claim ARIA compliance unless:



all clauses in this document are satisfied



deterministic replay passes within declared tolerance



commit logging minimum fields are present



escalation binding is active



End of Contract.

