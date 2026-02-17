---
name: qa-quality-gates
description: Define and enforce automated quality gates across critical user flows with coverage thresholds, regression checks, and stop-release criteria. Use when validating implementation readiness for hardening or release decisions.
---

# Purpose
Prevent fragile releases by validating both expected and adverse scenarios.  
Convert testing from ad-hoc checks into measurable release gates.

# Trigger Rules
- Use when implementation is complete and release readiness must be assessed.
- Use when new features may affect existing critical workflows.
- Use when bugs, regressions, or reliability risks are reported.

# Required Inputs
Required:
- Approved scope and acceptance criteria
- Current implementation notes and changed module list
- Critical path definition for product context
- Test environment and execution commands

Optional:
- Historical incident data
- Performance budgets
- Security test checklist

# Output Contract
- `test-plan.md`
  - Required headings: `Scope Under Test`, `Critical Paths`, `Test Types`, `Negative Scenarios`, `Regression Targets`, `Execution Plan`, `Next Skill`, `Suggested Command`
- `quality-gate-report.md`
  - Required headings: `Coverage Results`, `Critical Path Status`, `Lint/Static Analysis`, `Regression Findings`, `Release Decision`, `Blockers`, `Next Skill`, `Suggested Command`

# Workflow
1. Map changed scope to critical paths.
2. Generate or update automated tests for critical and negative cases.
3. Run regression tests on impacted legacy flows.
4. Execute lint/static analysis and summarize findings.
5. Evaluate against numeric gates and produce release decision.

# Decision Rules
Default critical path categories:
- `Auth & Security`: signup, login, permission checks
- `Core Transaction`: reservation/booking/data input
- `Revenue & Trust`: checkout/payment/data indexing

No-Go:
- Any failing critical path test.
- Lint or static analysis errors > 0.
- Missing regression verification for impacted legacy paths.

Exception:
- Non-critical test failures can be deferred only with explicit user approval and documented risk acceptance.

# Quality Gates
- Critical path coverage: `100%`.
- Overall code coverage: `>= 70%`.
- Lint/static analysis errors: `0`.
- Gate fail action: block release and return blocker list with remediation order.

# Handoff Contract
Immutable artifacts passed to DevOps and Loop Master:
- `test-plan.md`
- `quality-gate-report.md`
- Explicit pass/fail decision with blocker IDs
- Approved risk acceptance notes (if any)

# Anti-Patterns
- Test only happy path and ignore boundary conditions.
- Skip regression tests because "feature is isolated."
- Accept flaky tests without root-cause tracking.
- Merge with known critical test failures.
- Report pass status without evidence links or logs.

# Prompt Snippets
- `Run QA strict mode: enforce critical path coverage and release gates.`
- `Generate negative tests for this feature and map each to acceptance criteria.`
- `Produce release blocker report with remediation priority order.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

