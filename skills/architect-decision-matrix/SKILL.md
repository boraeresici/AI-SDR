---
name: architect-decision-matrix
description: Produce architecture options with weighted decision scoring based on project phase, including stack, auth, data/cache, delivery estimate, and explicit user approval gates. Use when selecting tech stack or validating architecture tradeoffs before implementation.
---

# Purpose
Turn architecture decisions into explicit, comparable options.  
Prevent single-path bias by forcing scored alternatives and approval checkpoints.

# Trigger Rules
- Use when user asks "which stack/architecture should we use?"
- Use when Blueprint phase needs contract-ready technical decision.
- Use when scalability, security, speed, and cost tradeoffs must be evaluated.

# Required Inputs
Required:
- Product goal and scope summary
- Project phase (`MVP` or `Scale/Prod`)
- Expected load profile (users, throughput, peak assumptions)
- Security requirements (auth, compliance constraints)

Optional:
- Team skill profile
- Vendor lock-in preference
- Existing infra constraints

# Output Contract
- `decision-matrix.md`
  - Required headings: `Phase`, `Scoring Weights`, `Option A`, `Option B`, `Score Table`, `Tradeoffs`, `Recommendation`, `User Approval`, `Next Skill`, `Suggested Command`
- `architecture-contract.md`
  - Required headings: `Selected Stack`, `Auth Model`, `Data Model`, `Cache Layer`, `API Contract Plan`, `Risks`, `Migration Notes`, `Next Skill`, `Suggested Command`

# Workflow
1. Confirm phase and ask for missing critical constraints.
2. Set scoring weights by phase.
3. Build at least 2 viable architecture options.
4. Score options against weighted criteria.
5. Present recommendation with tradeoffs and ask explicit user approval.

# Decision Rules
Default scoring:
- `MVP`: Time-to-market 40, Cost 30, Scalability 15, Security 15
- `Scale/Prod`: Scalability 35, Security 30, Cost 20, Time-to-market 15

No-Go:
- Present only one option.
- Skip auth/security model.
- Proceed to build without user approval.

Exception:
- User can override phase and force alternate weights; this override has highest priority.

# Quality Gates
- Minimum options: `>= 2`
- Each option must include: stack, auth, DB/cache, estimate, risk notes.
- Decision report must include weighted score table.
- Gate fail action: regenerate matrix before handoff.

# Handoff Contract
Pass immutable artifacts to PM and Loop Master:
- Approved decision matrix
- Architecture contract
- Phase mode and scoring weights used
- Explicit user approval record

# Anti-Patterns
- "We will use X" without alternatives.
- Ignore cost and operational complexity.
- Hide uncertainty in effort estimates.
- Suggest stack without matching team capability.
- Mix recommendation and implementation before approval.

# Prompt Snippets
- `Generate 2 architecture options with weighted scoring for MVP mode.`
- `Re-score current options in Scale/Prod mode and highlight deltas.`
- `Do not move to build. Ask: Onayliyor musunuz?`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

