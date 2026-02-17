---
name: architecture-drift-review
description: Detect post-release architectural drift and enforce corrective planning when implementation diverges from approved contracts and boundaries. Use after release or at iteration boundaries to preserve long-term system integrity.
---

# Purpose
Detect and control architecture erosion after release.  
Keep future iteration cost predictable by enforcing boundary integrity.

# Trigger Rules
- Use after production release during runtime review.
- Use when repeated exceptions or hotfixes alter structural boundaries.
- Use at sprint or milestone end for architecture health check.

# Required Inputs
Required:
- Approved architecture contract baseline
- Current implementation/module map
- Recent release notes and exception records
- Dependency graph or boundary map

Optional:
- ADR history
- Refactor backlog
- Performance/incident trends

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/post-release/architecture-drift-report.md`
  - Required headings: `Baseline`, `Detected Drift`, `Impact Assessment`, `Risk Level`, `Corrective Plan`, `Decision`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/post-release/drift-remediation-backlog.md`
  - Required headings: `Item`, `Priority`, `Effort`, `Owner`, `Target Iteration`, `Next Skill`, `Suggested Command`

# Workflow
1. Compare current structure against approved architecture baseline.
2. Identify boundary violations and dependency drift.
3. Estimate short/long-term impact and risk.
4. Propose remediation actions with timing.
5. Decide whether drift is acceptable for next iteration.

# Decision Rules
Default:
- Minor drift can be scheduled with explicit remediation tasks.
- Repeated drift in critical modules elevates risk level.

No-Go:
- Structural drift that invalidates core contracts without mitigation plan.
- Circular dependency introduction across bounded layers.
- Unowned remediation backlog for critical drift.

Exception:
- Temporary drift acceptance allowed only with explicit user approval and fixed remediation deadline.

# Quality Gates
- Critical drift items with owner/target iteration: `100%`.
- Core contract boundary violations unresolved: `0`.
- Remediation backlog completeness for accepted drift: `100%`.
- Gate fail action: force return to Blueprint planning before next major build.

# Handoff Contract
Immutable artifacts passed to Loop Master, Architect, and PM:
- `artifacts/YYYY-MM-DD/post-release/architecture-drift-report.md`
- `artifacts/YYYY-MM-DD/post-release/drift-remediation-backlog.md`
- Risk level classification
- Next iteration constraints

# Anti-Patterns
- Treat repeated hotfix changes as harmless exceptions.
- Ignore dependency direction changes over time.
- Accept drift without owner and target date.
- Mix architecture drift with style-only comments.
- Start next major build without drift review closure.

# Prompt Snippets
- `Run architecture drift review strict mode against approved baseline.`
- `Classify drift severity and generate remediation backlog with ownership.`
- `Decide if drift is acceptable for next iteration or requires Blueprint return.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

