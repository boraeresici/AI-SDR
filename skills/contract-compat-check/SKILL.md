---
name: contract-compat-check
description: Verify frontend-backend API compatibility and detect breaking schema/status changes before release progression. Use when API contracts evolve, endpoints change, or hardening requires compatibility certainty.
---

# Purpose
Protect delivery from hidden FE/BE integration breaks.  
Ensure API changes remain version-safe and contract-aligned.

# Trigger Rules
- Use in Hardening after QA pass and before release approval.
- Use when endpoint schema, required fields, or status codes change.
- Use when API versioning or backward compatibility is uncertain.

# Required Inputs
Required:
- Current OpenAPI or JSON schema contract
- Previous contract baseline
- Consumer expectations (frontend types or usage map)
- Changed endpoint list

Optional:
- Contract test results
- Changelog
- Consumer deprecation timeline

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/hardening/contract-compat-report.md`
  - Required headings: `Compared Versions`, `Breaking Changes`, `Backward-Compatible Changes`, `Ambiguous Changes`, `Decision`, `Required Actions`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/hardening/contract-diff.json`
  - Required schema:
    - Root type: `array`
    - Item type: `object`
    - Required keys: `endpoint`, `method`, `change_type`, `compatibility`, `impact`, `required_mitigation`
    - `change_type` enum: `request_schema`, `response_schema`, `required_field`, `status_code`, `endpoint_removed`, `endpoint_added`
    - `compatibility` enum: `breaking`, `additive`, `ambiguous`
    - `impact` enum: `high`, `medium`, `low`
    - `required_mitigation` type: `string` (non-empty)
  - Example item:
    - `{\"endpoint\":\"/v1/reminders\",\"method\":\"POST\",\"change_type\":\"required_field\",\"compatibility\":\"breaking\",\"impact\":\"high\",\"required_mitigation\":\"Version endpoint to /v2 and provide migration note\"}`

# Workflow
1. Load current and previous contract versions.
2. Diff request/response schema, required fields, and status codes.
3. Classify each change as breaking/additive/ambiguous.
4. Map potential impact to known consumers.
5. Produce gate decision and mitigation tasks.

# Decision Rules
Default:
- Additive backward-compatible changes: pass with notes.
- Ambiguous changes: mark `NEEDS_FIX`.

No-Go:
- Breaking change without versioning strategy.
- Required field additions that break existing consumers.
- Contract diff unavailable for changed endpoints.

Exception:
- Controlled breaking changes allowed only with explicit user approval and migration timeline.

# Quality Gates
- FE/BE contract incompatibilities on release scope: `0`.
- Every changed endpoint must have compatibility classification.
- Breaking changes must include version/migration plan.
- Gate fail action: block release and return compatibility blockers.

# Handoff Contract
Immutable artifacts passed to QA, DevOps, and Loop Master:
- `artifacts/YYYY-MM-DD/hardening/contract-compat-report.md`
- `artifacts/YYYY-MM-DD/hardening/contract-diff.json`
- Versioning or migration plan (if required)
- Release block/unblock decision

# Anti-Patterns
- Assume frontend can adapt without explicit migration plan.
- Hide breaking changes under generic release notes.
- Compare only endpoint names and skip payload shape.
- Ignore status code changes in compatibility checks.
- Approve release with unresolved ambiguous changes.

# Prompt Snippets
- `Run contract compatibility check strict mode against previous OpenAPI baseline.`
- `List only breaking changes and required mitigations for release readiness.`
- `Classify changed endpoints: additive, breaking, ambiguous.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
