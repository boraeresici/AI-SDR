# AI-SDR (Software Development Runtime)

Turkish version: [`README_TR.md`](./README_TR.md)  
Direct URL: <https://github.com/boraeresici/AI-SDR/blob/main/README_TR.md>

[![Repo](https://img.shields.io/badge/Repo-AI--SDR-0A66C2?logo=github)](https://github.com/boraeresici/AI-SDR)
[![Branch](https://img.shields.io/badge/Branch-main-2EA44F)](https://github.com/boraeresici/AI-SDR/tree/main)
[![Skill Spec](https://img.shields.io/badge/SKILL__SPEC-v1.0-6f42c1)](skill-spec/SKILL_SPEC_v1.0.md)
[![Skills](https://img.shields.io/badge/Skills-13-orange)](skills)
[![A11y](https://img.shields.io/badge/WCAG-2.1_AA-005A9C)](https://www.w3.org/WAI/WCAG21/quickref/)
[![QA Gate](https://img.shields.io/badge/Coverage-%3E%3D70%25-brightgreen)](skills/qa-quality-gates/SKILL.md)
[![Simulation](https://img.shields.io/badge/Simulation-Completed-2EA44F)](#simulation-status)
[![Process Flow](https://img.shields.io/badge/Process_Test-PASS-2EA44F)](#simulation-status)
[![Production Readiness](https://img.shields.io/badge/Production-NO--GO_(Simulation)-D93025)](#simulation-status)

AI-SDR is a skill-driven runtime that keeps vibe-coding speed while enforcing SDD (Software Design Document) discipline end-to-end.

## Simulation Status

- E2E process simulation completed on `2026-02-17`.
- Process orchestration validation: `PASS`.
- Production release decision in simulation run: `NO-GO` (runtime checks pending).

## Project Goal

- Control phase transitions: `Blueprint -> Build -> Hardening`
- Lock architecture, scope, UX, quality, operations, and ROI decisions with gates
- Standardize "fast delivery + low debt + measurable output"

## Skill Ecosystem

- `skills/loop-master-orchestrator/SKILL.md`
- `skills/idea-alchemist-market-strategist/SKILL.md`
- `skills/architect-decision-matrix/SKILL.md`
- `skills/pm-context-scope/SKILL.md`
- `skills/ux-design-system/SKILL.md`
- `skills/fullstack-implementation-refactor/SKILL.md`
- `skills/qa-quality-gates/SKILL.md`
- `skills/devops-deployment-stability/SKILL.md`
- `skills/roi-investor-check/SKILL.md`
- `skills/contract-compat-check/SKILL.md`
- `skills/e2e-execution-gate/SKILL.md`
- `skills/security-review-gate/SKILL.md`
- `skills/architecture-drift-review/SKILL.md`

## Canonical Standards

- Skill format standard: `skill-spec/SKILL_SPEC_v1.0.md`
- Refactor plan: `skill-spec/SKILL_REFACTOR_PLAN_v1.md`
- Skill improvement backlog: `skill-spec/SKILL_IMPROVEMENT_BACKLOG.md`
- Multi-provider skill manifests: `skills/*/agents/{manifest,openai,claude,gemini}.yaml`
- Process diagram (render): `process.md`
- Process source: `process.mmd`
- User guide: `USERGUIDE.md`
- Standalone skill usage: `USERGUIDE.md` (`Standalone Skill Calistirma`)
- Artifact output standard: `artifacts/YYYY-MM-DD/<phase>/`
- Local validation: `bash scripts/validate-skills.sh`

## Repository Structure

```text
.
├── README.md
├── README_TR.md
├── .github
│   └── workflows/
│       └── validate-skills.yml
├── process.md
├── process.mmd
├── scripts
│   └── validate-skills.sh
├── artifacts
│   └── YYYY-MM-DD
│       ├── blueprint/
│       ├── build/
│       ├── hardening/
│       ├── release/
│       └── post-release/
├── domains
│   ├── INDEX.md
│   ├── edtech.md
│   ├── fintech-defi.md
│   ├── healthtech-senior-care.md
│   ├── martech-customer-analytics.md
│   ├── saas-productivity.md
│   ├── senior-care.md
│   └── smb-booking.md
├── skill-spec
│   ├── SKILL_SPEC_v1.0.md
│   ├── SKILL_REFACTOR_PLAN_v1.md
│   └── SKILL_IMPROVEMENT_BACKLOG.md
├── templates
│   ├── decision-matrix.md
│   ├── scope-pack.md
│   └── quality-gate-report.md
└── skills
    ├── <skill-name>/
    │   ├── SKILL.md
    │   └── agents/
    │       ├── manifest.yaml
    │       ├── openai.yaml
    │       ├── claude.yaml
    │       └── gemini.yaml
    └── ...
```

## Process Summary

1. Idea Maturation:
   - `Idea Alchemist & Market Strategist` turns raw ideas into strategy-ready inputs.
2. Blueprint Loop:
   - Loop Master runs `Domain Constraint Pre-check` using `domains/INDEX.md` + selected domain doc.
   - If domain redlines fail, process is `BLOCKED` and idea/scope must be refined.
3. Build Loop:
   - Designer + Developer execute under quality and architecture constraints.
4. Hardening Loop:
   - QA + Contract + E2E + Security + DevOps gates run before release.
5. ROI + Drift:
   - ROI decision and post-release architecture drift checks.

## Process Diagram

- Rendered file: `process.md`
- Open in GitHub: [process.md](./process.md)

## Artifact Policy

- Skill definitions are reusable, so project-specific outputs are never written under `skills/`.
- All phase outputs are written under `artifacts/YYYY-MM-DD/<phase>/`.
- Loop Master validates required artifact presence on each phase transition.

## Project Docs

- Contribution guide: `CONTRIBUTING.md`
- Code of conduct: `CODE_OF_CONDUCT.md`
- Security policy: `SECURITY.md`
- Changelog: `CHANGELOG.md`
- Skill validation workflow: `.github/workflows/validate-skills.yml`

## Templates

- `templates/decision-matrix.md`
- `templates/scope-pack.md`
- `templates/quality-gate-report.md`

## Domains

- `domains/INDEX.md` (active domain docs + versions)
- `domains/senior-care.md`
- `domains/smb-booking.md`
- `domains/healthtech-senior-care.md`
- `domains/fintech-defi.md`
- `domains/saas-productivity.md`
- `domains/martech-customer-analytics.md`
- `domains/edtech.md`

## Quick Start in 5 Minutes

1. Start Blueprint:
   - `Loop Master, start Blueprint Loop in strict mode for [idea]. Domain: [domains/*.md]. Goal: [...]. Scope: [...]. Success metric: [...].`
2. Run architecture decision:
   - `Architect, prepare a 2-option MVP decision matrix and initial API/Auth/Data contracts.`
3. Lock scope:
   - `PM, produce scope-pack with MoSCoW and keep Must <= 60%.`
4. Produce UI constraints:
   - `Designer, generate ui-constraints with WCAG 2.1 AA and 375/768/1024/1440 breakpoints.`
5. Continue flow:
   - `Developer -> QA -> Contract -> E2E -> Security -> DevOps -> ROI -> Drift`

## License

This repository is licensed under `MIT`. See `LICENSE`.
