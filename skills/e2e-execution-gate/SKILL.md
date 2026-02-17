---
name: e2e-execution-gate
description: Execute and evaluate end-to-end critical scenarios with artifact-backed pass/fail decisions before release progression. Use when validating real user journeys in staging or pre-production environments.
---

# Purpose
Confirm that critical user journeys work in integrated runtime conditions.  
Prevent releasing features that pass unit tests but fail in real flow execution.

# Trigger Rules
- Use in Hardening after contract compatibility check.
- Use when critical flows are affected by release scope.
- Use when staging validation is required before production approval.

# Required Inputs
Required:
- Target environment (`staging` by default)
- Scenario selector (`critical`, `smoke`, or explicit list)
- Path to scenario definitions
- Test runner configuration

Optional:
- Prior E2E baseline reports
- Flaky test registry
- Environment overrides

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/hardening/e2e-execution-report.md`
  - Required headings: `Environment`, `Scenario Selector`, `Summary`, `Failed Scenarios`, `Artifacts`, `Decision`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/hardening/e2e-artifacts-index.md`
  - Required headings: `Logs`, `Screenshots`, `Videos`, `Failure Details`, `Next Skill`, `Suggested Command`

# Workflow
1. Resolve scenario selection from immutable test sources.
2. Execute scenarios in target environment.
3. Capture logs and failure artifacts.
4. Separate regression signals from environment noise.
5. Publish gate decision with blocker scenarios.

# Decision Rules
Default:
- Continue execution on scenario failures to collect full signal.
- Fail fast only on infrastructure-level test runner failure.

No-Go:
- Any failing critical scenario.
- Missing execution artifacts for failed scenarios.
- Scenario source modified during run.

Exception:
- Known flaky non-critical scenarios can be waived only with explicit user approval and follow-up ticket.

# Quality Gates
- Critical scenario failures: `0`.
- Artifact completeness for failures: `100%`.
- Scenario source integrity: `100% immutable during execution`.
- Gate fail action: block release and return failing scenario remediation order.

# Handoff Contract
Immutable artifacts passed to QA, DevOps, and Loop Master:
- `artifacts/YYYY-MM-DD/hardening/e2e-execution-report.md`
- `artifacts/YYYY-MM-DD/hardening/e2e-artifacts-index.md`
- Blocker scenario list and retest criteria
- Release block/unblock decision

# Anti-Patterns
- Run only happy-path scenarios for release gate.
- Ignore flaky tests without tracking and ownership.
- Report pass/fail without linking execution artifacts.
- Change scenario definitions to force pass.
- Treat environment instability as automatic test pass.

# Prompt Snippets
- `Run E2E gate strict mode for critical scenarios on staging.`
- `Generate blocker list from failed critical scenarios with artifact links.`
- `Differentiate regression vs environment noise in E2E failures.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

