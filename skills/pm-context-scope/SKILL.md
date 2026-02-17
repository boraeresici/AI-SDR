---
name: pm-context-scope
description: Convert architecture contracts into scoped, prioritized, and testable delivery context using MoSCoW, measurable acceptance criteria, and Definition of Done controls. Use when preparing build-ready tasks, controlling scope, or preventing uncontrolled feature expansion during vibe coding.
---

# Purpose
Translate blueprint decisions into executable delivery scope.  
Protect implementation flow from ambiguity, scope creep, and priority drift.

# Trigger Rules
- Use when Blueprint output must be converted into implementation-ready task packs.
- Use when team asks for scope, priorities, user stories, or acceptance criteria.
- Use when backlog becomes overloaded and priority rebalance is needed.

# Required Inputs
Required:
- Approved architecture contract
- Immutable API contract
- Product objective and release goal
- Constraint list (time, team, budget)

Optional:
- Existing backlog
- Analytics or customer feedback
- Risk register

# Output Contract
- `scope-pack.md`
  - Required headings: `Feature Scope`, `MoSCoW Prioritization`, `User Stories`, `Acceptance Criteria`, `Definition of Done`, `Out of Scope`, `Risks`, `Next Skill`, `Suggested Command`

# Workflow
1. Read architecture and release objective.
2. Split features into atomic user stories.
3. Prioritize with MoSCoW as default model.
4. Enforce Must-capacity limit and rebalance if needed.
5. Add measurable acceptance criteria and DoD.
6. Publish scope pack as immutable build input.

# Decision Rules
Default:
- Use `MoSCoW` for prioritization.
- `Must` scope cannot exceed `60%` of sprint backlog capacity.
- Each feature must have measurable acceptance criteria and DoD items.

No-Go:
- Start build without approved `scope-pack.md`.
- Mark nearly all items as `Must`.
- Define tasks without acceptance criteria.

Exception:
- For complex products, run `RICE` scoring as secondary validation layer before finalizing priorities.

# Quality Gates
- `Must` ratio: `<= 60%` of sprint capacity.
- Each scoped feature: at least `1` user story + `3` measurable acceptance criteria.
- DoD completeness: `100%` for all `Must` items.
- Gate fail action: freeze scope and return rebalance recommendations.

# Handoff Contract
Immutable artifacts passed to Designer and Developer:
- Approved `scope-pack.md`
- Final prioritized backlog labels (`Must/Should/Could/Won't`)
- Acceptance criteria and DoD set
- Declared out-of-scope list

# Anti-Patterns
- Convert all stakeholder requests directly into `Must`.
- Skip out-of-scope declaration.
- Accept vague statements like "should be fast" without metric.
- Change priorities during build without formal update.
- Treat DoD as optional checklist.

# Prompt Snippets
- `Generate scope-pack strict mode with MoSCoW and enforce Must <= 60%.`
- `Rebalance backlog because Must exceeds capacity. Propose downgrades to Should/Could.`
- `Add measurable acceptance criteria and DoD for each Must item.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.

