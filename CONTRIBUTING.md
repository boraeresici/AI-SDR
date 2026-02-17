# Contributing to AI-SDR

Thanks for contributing. This repository uses a skill-first workflow.

## Contribution Flow

1. Open an issue (or reference an existing one) with scope and intent.
2. Create a feature branch from `main`.
3. Apply changes with clear artifact impact (`skills/`, `skill-spec/`, `README`, etc.).
4. Run a self-check:
   - `SKILL.md` files keep required structure.
   - Output contracts remain consistent with artifact policy.
   - Docs are updated when behavior changes.
   - Run `bash scripts/validate-skills.sh` and ensure it passes.
5. Open a Pull Request using the template below.

## Pull Request Format

Use this structure in PR description:

1. **Summary**
2. **Why**
3. **Scope**
4. **Files Changed**
5. **Validation**
6. **Risks / Tradeoffs**
7. **Follow-ups**

Minimum PR checklist:

- [ ] Change is scoped and reversible
- [ ] Related docs updated
- [ ] No unrelated files included
- [ ] Artifact policy respected (`artifacts/...` for runtime outputs)

## Commit Message Standard

Use short, imperative subject lines:

- `feat: add standalone skill usage guide`
- `docs: update artifact policy in README`
- `refactor: align output headings across skills`
- `fix: enforce next-skill handoff in loop master`

Format:

`<type>: <short summary>`

Recommended types:

- `feat`
- `fix`
- `docs`
- `refactor`
- `chore`
