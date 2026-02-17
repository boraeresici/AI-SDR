---
name: roi-investor-check
description: Evaluate feature and release decisions through business viability, scaling economics, and technical sustainability metrics before final go/no-go. Use when validating whether delivery outcomes justify cost, complexity, and strategic direction.
---

# Purpose
Ensure engineering output creates business value, not only technical completion.  
Block releases or expansions that weaken long-term product economics.

# Trigger Rules
- Use before final release go/no-go decisions.
- Use when a feature increases infra cost or architectural complexity.
- Use when roadmap prioritization needs business impact validation.

# Required Inputs
Required:
- Release/readiness reports from QA and DevOps
- Feature scope and delivery effort summary
- Estimated or measured infra cost per active user
- Refactor and new feature effort estimates

Optional:
- Revenue projections
- Churn/retention assumptions
- Strategic roadmap themes

# Output Contract
- `roi-gate-report.md`
  - Required headings: `Business Objective`, `Cost Profile`, `Debt Profile`, `Velocity Impact`, `Risk Notes`, `Decision Rationale`, `Next Skill`, `Suggested Command`
- `go-no-go.md`
  - Required headings: `Decision`, `Conditions`, `Deferred Risks`, `Re-evaluation Date`, `Next Skill`, `Suggested Command`

# Workflow
1. Map release scope to intended business outcome.
2. Evaluate unit economics and infra cost pressure.
3. Calculate technical debt ratio and assess sustainability.
4. Assess development velocity impact against roadmap goals.
5. Issue go/no-go recommendation with explicit conditions.

# Decision Rules
Default:
- Evaluate `Infra Cost per Active User` as primary scaling guardrail.
- Calculate `Technical Debt Ratio = refactor_effort / new_feature_effort`.
- Evaluate whether current work accelerates or slows strategic velocity.

No-Go:
- Debt ratio indicates feature work is dominated by refactor burden without clear payoff.
- Infra cost trend invalidates expected business return.
- Recommendation lacks measurable rationale or re-evaluation date.

Exception:
- Strategic loss-leader release can proceed only with explicit user approval and time-boxed recovery plan.

# Quality Gates
- `roi-gate-report.md` and `go-no-go.md` completeness: `100%`.
- Debt ratio formula must be present and computed for the evaluated scope.
- Decision must include measurable conditions and re-check date.
- Gate fail action: return decision as `NO-GO` until missing evidence is provided.

# Handoff Contract
Immutable artifacts passed to Loop Master and PM:
- `roi-gate-report.md`
- `go-no-go.md`
- Documented decision conditions
- Next review trigger and date

# Anti-Patterns
- Approve release based only on delivery speed.
- Ignore infra cost drift because "it works now."
- Treat technical debt as qualitative opinion without metric.
- Skip explicit re-evaluation timeline.
- Approve roadmap expansion without capacity impact check.

# Prompt Snippets
- `Run investor-check strict mode with debt ratio and infra cost analysis.`
- `Produce go/no-go decision with measurable conditions and re-evaluation date.`
- `Assess whether this feature improves or harms strategic development velocity.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

