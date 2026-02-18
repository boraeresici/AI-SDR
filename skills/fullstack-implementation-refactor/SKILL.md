---
name: fullstack-implementation-refactor
description: Implement and refactor backend/frontend code under strict architecture, typing, query, and maintainability constraints with stop-on-violation controls. Use when building features from approved scope packs or hardening implementation quality before review.
---

# Purpose
Deliver production-grade code that stays aligned with architecture, PM scope, and UX constraints.  
Stop quality debt from entering the codebase during fast iteration.

# Trigger Rules
- Use when implementation starts after Blueprint and PM scope approval.
- Use when code quality violations are found and refactor is required.
- Use when backend/frontend contract compliance must be enforced.

# Required Inputs
Required:
- Approved `scope-pack.md`
- Immutable API contract
- Approved `ui-constraints.md` (for UI work)
- Architecture contract and data schema

Optional:
- Existing code style or lint configuration
- Performance budget targets
- Module-level risk notes

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.

# Output Contract
- `artifacts/YYYY-MM-DD/build/implementation-plan.md`
  - Required headings: `Scope Mapping`, `Backend Plan`, `Frontend Plan`, `Contract Alignment`, `Risk Controls`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/build/pr-quality-notes.md`
  - Required headings: `Implemented Items`, `Refactors`, `No-Go Checks`, `Test Notes`, `Known Tradeoffs`, `Next Skill`, `Suggested Command`

# Workflow
1. Map scoped tasks to backend/frontend modules.
2. Implement backend with service-layer separation and contract-safe APIs.
3. Implement frontend with typed contracts and component boundaries.
4. Run No-Go checks and stop on violation.
5. Refactor for readability, reusability, and performance.
6. Publish PR quality notes and remaining risks.

# Decision Rules
Default:
- Business logic belongs in `services.py` (backend) or custom hooks/use-cases (frontend), not views/components.
- API responses follow contract and consistent error shape.
- Strong typing required in Python and TypeScript.
- Implement by module boundaries first (`domain/application/integration`) to preserve future service extraction paths.
- Keep critical capabilities reusable with stable interfaces to enable cross-project packaging.
- For auth and other commodity concerns, integrate proven/popular libraries first and document why custom code is needed if selected.

No-Go:
- TypeScript `any` usage in production code.
- Missing Python type hints in function signatures.
- Business logic directly in view/component layer.
- N+1 query risk without `select_related` / `prefetch_related`.
- Cross-module direct coupling that bypasses declared service/contract boundaries.
- Introducing new dependencies without performance, maintenance, and security impact notes.

Exception:
- Temporary technical debt allowed only with explicit user approval and a dated cleanup task in output notes.

# Quality Gates
- No-Go violations: `0` (hard blocker).
- Contract mismatch count: `0` for required endpoints.
- Lint/type checks: `100% pass` for changed modules.
- Modular boundary violations: `0` in changed scope.
- Gate fail action: stop coding, emit violation report, and require fix before continuation.

# Handoff Contract
Immutable artifacts passed to QA and DevOps:
- `artifacts/YYYY-MM-DD/build/implementation-plan.md`
- `artifacts/YYYY-MM-DD/build/pr-quality-notes.md`
- Updated module boundaries (services/hooks/contracts)
- Explicit list of deferred items (if approved)

# Handoff Validation Checklist
- Verify every file listed under Output Contract exists at the declared artifact path.
- Verify each markdown output includes Next Skill and Suggested Command.
- Verify gate decision (PASS/BLOCK/NO-GO) is explicit in handoff artifacts.
- Verify unresolved risks and owner/action are recorded before handoff.

# Anti-Patterns
- Start coding from memory without scope/contract mapping.
- Patch logic in UI layer to bypass backend gaps.
- Use `any` to silence type issues.
- Ignore queryset optimization in data-heavy endpoints.
- Add hidden behavior not reflected in acceptance criteria.

# Prompt Snippets
- Standalone template: <Skill>, [goal/scope] icin standalone mode calistir. Inputs: [artifact1], [artifact2]. Output path: artifacts/YYYY-MM-DD/<phase>/.
- `Run implementation strict mode and stop on any No-Go violation.`
- `Refactor this module to move business logic out of view/component layer.`
- `Audit changed queries for N+1 and propose fixes with related/prefetch usage.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
Skill Version: v1.1.0
