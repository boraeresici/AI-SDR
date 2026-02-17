# Skill Improvement Backlog

## P0 (Must)
- [ ] Standardize `Output Contract` paths to `artifacts/YYYY-MM-DD/<phase>/...` for all skills.
- [ ] Add `Input Completion Questions` section to every skill and enforce stop-and-ask behavior for missing required inputs.
- [ ] Strengthen JSON output contracts with typed schema/enums for:
  - `skills/contract-compat-check/SKILL.md`
  - `skills/security-review-gate/SKILL.md`
- [ ] Add automated skill validation:
  - `scripts/validate-skills.sh`
  - `.github/workflows/validate-skills.yml`

## P1 (Should)
- [ ] Add `agents/openai.yaml` metadata for all skills (`display_name`, `short_description`, `default_prompt`).
- [ ] Add a standalone command template line in each skill.
- [ ] Add domain pre-check precondition to hardening skills when running standalone.
- [ ] Unify language consistency for section labels referenced from domain docs.
- [ ] Add per-skill version marker policy aligned with `CHANGELOG.md`.
- [ ] Add handoff validation checklist in each skill.
