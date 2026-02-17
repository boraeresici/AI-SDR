---
name: security-review-gate
description: Enforce pre-release security review gates for code and configuration changes with risk classification, actionable findings, and merge/release decisions. Use when hardening release candidates or validating security posture after impactful changes.
---

# Purpose
Prevent high-impact vulnerabilities from reaching release.  
Turn security review into a measurable gate instead of best-effort advice.

# Trigger Rules
- Use before release candidate approval in Hardening.
- Use when auth, permission, input handling, secrets, or infra config changes.
- Use when dependency or supply-chain risk changes are detected.

# Required Inputs
Required:
- Code/config diff or change summary
- Dependency audit output (if available)
- Previous security findings or accepted-risk registry
- Target environment (`staging` or `prod`)

Optional:
- CI security scan links
- Threat model notes
- Incident history

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/hardening/security-gate-report.md`
  - Required headings: `Scope`, `Overall Risk`, `New Findings`, `Resolved Findings`, `Accepted Risks`, `Regression Analysis`, `Decision`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/hardening/security-findings.json`
  - Required schema:
    - Root type: `array`
    - Item type: `object`
    - Required keys: `id`, `severity`, `category`, `location`, `impact`, `recommendation`, `status`, `owner`, `due_date`
    - `severity` enum: `critical`, `high`, `medium`, `low`
    - `status` enum: `open`, `mitigated`, `accepted_risk`, `resolved`
    - `category` enum: `auth`, `authorization`, `input_validation`, `secret_management`, `dependency`, `config`, `logging_privacy`
    - `owner` type: `string` (non-empty)
    - `due_date` format: `YYYY-MM-DD`
  - Example item:
    - `{\"id\":\"SEC-2026-001\",\"severity\":\"high\",\"category\":\"auth\",\"location\":\"api/auth/login.ts:42\",\"impact\":\"Account takeover risk\",\"recommendation\":\"Enable rate limiting and lockout\",\"status\":\"open\",\"owner\":\"backend-team\",\"due_date\":\"2026-02-20\"}`

# Workflow
1. Collect current diff and prior security context.
2. Analyze auth, validation, secrets, and dependency risk.
3. Classify findings by severity and exploitability.
4. Compare against accepted risks and prior state.
5. Publish gate decision and remediation priorities.

# Decision Rules
Default:
- `LOW/MEDIUM` findings can be merged with mitigation tasks.
- Security regressions must be explicitly flagged.

No-Go:
- Any unmitigated `HIGH` or `CRITICAL` finding.
- Missing risk rationale for accepted findings.
- Release request without evidence artifacts.

Exception:
- Temporary acceptance of high risk only with explicit user approval, expiry date, and compensating controls.

# Quality Gates
- High/Critical unmitigated findings: `0`.
- Required evidence sections: `100% present`.
- Every finding must include owner and next action.
- Gate fail action: block release and return prioritized remediation list.

# Handoff Contract
Immutable artifacts passed to DevOps and Loop Master:
- `artifacts/YYYY-MM-DD/hardening/security-gate-report.md`
- `artifacts/YYYY-MM-DD/hardening/security-findings.json`
- Accepted-risk references and expiration dates
- Release block/unblock decision

# Anti-Patterns
- Mark a finding resolved without evidence.
- Treat accepted risks as permanent exemptions.
- Ignore dependency risk because app code did not change.
- Collapse all findings into one generic recommendation.
- Approve release without severity-based decision logic.

# Prompt Snippets
- `Run security gate strict mode and block on unmitigated HIGH/CRITICAL findings.`
- `Compare current security posture with previous review and flag regressions.`
- `Generate remediation priorities with owner and due date hints.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
