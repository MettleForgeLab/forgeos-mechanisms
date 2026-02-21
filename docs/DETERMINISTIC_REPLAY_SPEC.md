# Deterministic Replay Spec (Control Plane)

Given identical:

- input
- config_hash
- param_block_hash
- seed
- model version metadata

Must produce identical:

- routing decision
- gating parameters
- deterministic commit hash

Token sampling may vary; control must not.
