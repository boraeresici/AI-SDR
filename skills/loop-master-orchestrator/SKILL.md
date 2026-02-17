---
name: loop-master-orchestrator
description: Orchestrate SDD phases from blueprint to build to hardening with strict gatekeeping, rollback control, and immutable handoff artifacts. Use when coordinating multi-role AI development flow, enforcing phase transitions, or stopping unsafe coding progress.
---

# Purpose
Run the end-to-end workflow as phase controller.  
Protect speed without breaking architecture, scope, or quality commitments.

# Trigger Rules
- Use when user asks to start, continue, or control Blueprint/Build/Hardening loops.
- Use when multiple roles must align before coding starts.
- Use when an in-flight build needs gate check or rollback decision.

# Required Inputs
Required:
- `project_phase` (`MVP` or `Scale/Prod`)
- Immutable API contract (`OpenAPI` or `JSON Schema`)
- PM-approved DoD list (3-5 measurable items)
- Auth/security scheme and role-permission table
- Data schema diagram (`Mermaid ERD`)

Optional:
- Risk register
- Cost guardrails
- Timeline targets
- Trigger-to-skill mapping table

# Output Contract
- `phase-gate-report.md`
  - Required headings: `Current Phase`, `Gate Checks`, `Decision`, `Blocking Issues`, `Next Step`
- `rollback-decision.md` (only if rollback triggered)
  - Required headings: `Trigger`, `Reason`, `Required Blueprint Changes`, `Resume Criteria`

# Workflow
1. Detect requested action and current phase.
2. Validate required artifacts for phase entry.
3. Run role checks in order: Strategist -> Analyst -> Architect -> PM -> Designer -> Developer -> QA -> DevOps -> Investor (as phase requires).
4. Enforce gate: pass, block, or rollback.
5. Publish immutable handoff package for next phase.

Trigger-to-Skill Mapping (embedded):
- `hardening:contract-check` -> `contract-compat-check`
- `hardening:e2e-check` -> `e2e-execution-gate`
- `hardening:security-check` -> `security-review-gate`
- `post-release:drift-check` -> `architecture-drift-review`
- `build:scope-prepare` -> `pm-context-scope`
- `build:ui-constraints` -> `ux-design-system`
- `build:implementation` -> `fullstack-implementation-refactor`
- `hardening:quality` -> `qa-quality-gates`
- `hardening:release` -> `devops-deployment-stability`
- `release:business-decision` -> `roi-investor-check`

# Decision Rules
Default:
- No phase transition without all required artifacts.
- Architect proposes phase mode weights; user override wins.
- Trigger-to-skill routing uses the embedded mapping table as source of truth.

No-Go:
- Build phase reveals new table or API contract not in blueprint.
- Security/auth design undefined.
- DoD missing or non-measurable.

Exception:
- Emergency hotfix path allowed only if user explicitly approves reduced gates.

# Quality Gates
- `Blueprint -> Build`: 100% required artifact presence.
- `Build -> Hardening`: 0 active No-Go violations.
- `Hardening -> Release Candidate`: QA gate pass + DevOps pre-check pass.
- Gate fail action: stop execution and return to prior phase with blocking report.

# Handoff Contract
Immutable artifacts passed forward:
- API contract
- Data schema ERD
- Auth/permission table
- DoD and acceptance criteria
- Active risk decisions

# Anti-Patterns
- Start coding before blueprint contract is complete.
- Treat advisory feedback as optional when marked blocker.
- Allow silent scope expansion in build phase.
- Continue after No-Go violation.
- Rewrite immutable artifacts inside downstream phases.

# Prompt Snippets
- `Run Loop Master strict mode. Validate gates and stop on any No-Go.`
- `Before Build, show missing artifacts and block transition if incomplete.`
- `Evaluate current state and decide pass/block/rollback with rationale.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
