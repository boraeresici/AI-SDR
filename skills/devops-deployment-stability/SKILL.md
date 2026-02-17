---
name: devops-deployment-stability
description: Prepare and validate deployment safety with container hardening, CI/CD controls, migration risk checks, and manual production approval gates. Use when promoting builds to staging/production or evaluating release operational readiness.
---

# Purpose
Move software from implementation to reliable runtime operations.  
Reduce release risk through explicit deployment and migration controls.

# Trigger Rules
- Use when a build is ready for staging or production deployment.
- Use when schema migrations are included in a release.
- Use when infra, security, or runtime stability checks are required.

# Required Inputs
Required:
- QA quality gate report
- Release candidate artifact (image/build identifier)
- Infrastructure target definition (staging/prod)
- Migration files and SQL diff summary

Optional:
- Incident history
- SLO/SLI targets
- Rollback playbook
- Selected domain reference (`domains/<domain>.md`) for standalone runs

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/hardening/release-readiness.md`
  - Required headings: `Release Scope`, `Pre-check Results`, `Security Checks`, `Performance Risk`, `Go/No-Go`, `Approval Status`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/hardening/migration-risk-note.md`
  - Required headings: `Migration Summary`, `SQL Diff`, `Lock Risk`, `Rollback Plan`, `Approval Requirement`, `Next Skill`, `Suggested Command`

# Workflow
1. Validate QA pass status and release artifact integrity.
2. Run Architect + DevOps pre-check for infra and migration safety.
3. Evaluate container, CI/CD, and edge security readiness.
4. Apply deployment policy by environment (staging/prod).
5. Produce readiness report and request required approval.

# Decision Rules
Default:
- Staging migrations can run automatically through CI/CD.
- Production migrations require manual user approval.
- AI must present Architect + DevOps pre-check before asking prod approval.

No-Go:
- Missing SQL diff for production migration.
- Missing rollback plan for schema-changing release.
- Attempt production apply without explicit user approval.
- Standalone execution without domain pre-check evidence from selected domain doc.

Exception:
- Emergency release path allowed only with explicit user approval and post-release audit requirement.

# Quality Gates
- QA status: `PASS` required.
- Migration safety docs: `100% present` for production.
- Approval gate: explicit user confirmation required for production apply.
- Gate fail action: block production deployment and return actionable blocker list.

# Handoff Contract
Immutable artifacts passed to Loop Master and Investor check:
- `artifacts/YYYY-MM-DD/hardening/release-readiness.md`
- `artifacts/YYYY-MM-DD/hardening/migration-risk-note.md`
- Approval log (requested/granted/denied)
- Rollback activation steps

# Handoff Validation Checklist
- Verify every file listed under Output Contract exists at the declared artifact path.
- Verify each markdown output includes Next Skill and Suggested Command.
- Verify gate decision (PASS/BLOCK/NO-GO) is explicit in handoff artifacts.
- Verify unresolved risks and owner/action are recorded before handoff.

# Anti-Patterns
- Treat staging success as automatic production approval.
- Run production migration without SQL diff visibility.
- Hide lock or downtime risk assumptions.
- Deploy without rollback rehearsal notes.
- Skip security edge checks under time pressure.

# Prompt Snippets
- Standalone template: <Skill>, [goal/scope] icin standalone mode calistir. Inputs: [artifact1], [artifact2]. Output path: artifacts/YYYY-MM-DD/<phase>/.
- `Run release readiness strict mode for production with migration risk audit.`
- `Generate Architect + DevOps pre-check summary before deployment approval request.`
- `Block apply and list missing artifacts for safe production migration.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
Skill Version: v1.1.0
