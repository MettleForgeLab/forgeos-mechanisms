# Control-Plane State Machine (Formal)

State sequence (deterministic control plane):

IDLE
→ SNAPSHOT_CONFIG (resolve + hash)
→ SEED_DECLARE (explicit seed)
→ TELEMETRY_COLLECT (declared deterministic only)
→ ROUTE_DECIDE (pre-decode)
→ GATE_RESOLVE (pre-decode)
→ COMMIT_PREP (prepare deterministic commit)
→ DECODE_START (first token emission; membrane begins)
→ STREAM_TOKENS (no mutation)
→ ATOMIC_COMMIT_WRITE (terminal membrane action)
→ POST_EVENT (observe only)
→ IDLE
