# Skill Improvement Backlog

## P0 (Must)
- [x] Standardize `Output Contract` paths to `artifacts/YYYY-MM-DD/<phase>/...` for all skills.
- [x] Add `Input Completion Questions` section to every skill and enforce stop-and-ask behavior for missing required inputs.
- [x] Strengthen JSON output contracts with typed schema/enums for:
  - `skills/contract-compat-check/SKILL.md`
  - `skills/security-review-gate/SKILL.md`
- [x] Add automated skill validation:
  - `scripts/validate-skills.sh`
  - `.github/workflows/validate-skills.yml`

## P1 (Should)
- [x] Add multi-provider agent manifests for all skills:
  - `agents/openai.yaml`
  - `agents/claude.yaml`
  - `agents/gemini.yaml`
  - Implemented with provider-agnostic `agents/manifest.yaml` + provider-specific files.
- [x] Add a standalone command template line in each skill.
- [x] Add domain pre-check precondition to hardening skills when running standalone.
- [x] Unify language consistency for section labels referenced from domain docs.
- [x] Add per-skill version marker policy aligned with `CHANGELOG.md`.
- [x] Add handoff validation checklist in each skill.
