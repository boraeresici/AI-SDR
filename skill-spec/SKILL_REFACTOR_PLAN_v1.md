# Skill Refactor Plan v1

Bu plan, mevcut rol dokumanlarini `SKILL_SPEC_v1.0.md` formatina donusturur.

## 1) Refactor Order

1. `The Loop Master.md` -> `loop-master-orchestrator/SKILL.md`
2. `Product Strategist & Solution Architect.md` + `The Advisory Board.md` -> `architect-decision-matrix/SKILL.md`
3. `Context & Scope.md` -> `pm-context-scope/SKILL.md`
4. `Design System & Experience.md` -> `ux-design-system/SKILL.md`
5. `Implementation & Refactor.md` -> `fullstack-implementation-refactor/SKILL.md`
6. `Quality Gate & Edge Cases.md` -> `qa-quality-gates/SKILL.md`
7. `Deployment & Stability.md` -> `devops-deployment-stability/SKILL.md`
8. `The Final ROI.md` -> `roi-investor-check/SKILL.md`

## 2) Baseline Decisions (lock)

Asagidaki kararlar baseline kabul edildi:

- Blueprint -> Build minimum artefakt:
  - Immutable API Contract (OpenAPI/JSON Schema)
  - PM onayli DoD (3-5 madde)
  - Security/Auth scheme + role/permission table
  - Data schema (Mermaid ERD)
- Rollback:
  - Build sirasinda kontratta olmayan API veya tablo ihtiyaci cikarsa Blueprint'e geri don.
- Architect dynamic weighting:
  - MVP: Time 40, Cost 30, Scalability 15, Security 15
  - Scale/Prod: Scalability 35, Security 30, Cost 20, Time 15
- PM prioritization:
  - Varsayilan: MoSCoW
  - Karmasik urunlerde RICE ekle
- UX accessibility:
  - WCAG 2.1 AA default zorunlu
- Fullstack No-Go:
  - TypeScript `any` yasak (blocker)
  - Python type hint eksigi blocker
  - Business logic view/component icinde blocker
  - N+1 blocker
- QA gates:
  - Critical path coverage: %100
  - Genel coverage: >= %70
  - Lint errors: 0
- DevOps migration policy:
  - Staging auto apply
  - Production manual approval + SQL diff zorunlu
- ROI gates:
  - Infra cost per active user
  - Technical debt ratio
  - Development velocity impact

## 3) Skill-by-Skill Output Contracts

### loop-master-orchestrator
- `phase-gate-report.md`
- `rollback-decision.md` (varsa)

### architect-decision-matrix
- `decision-matrix.md` (2+ opsiyon, agirlikli skor)
- `architecture-contract.md`

### pm-context-scope
- `scope-pack.md` (MoSCoW + AC + DoD)

### ux-design-system
- `ui-constraints.md` (tokens, responsive, a11y checks)

### fullstack-implementation-refactor
- `implementation-plan.md`
- `pr-quality-notes.md`

### qa-quality-gates
- `test-plan.md`
- `quality-gate-report.md`

### devops-deployment-stability
- `release-readiness.md`
- `migration-risk-note.md`

### roi-investor-check
- `roi-gate-report.md`
- `go-no-go.md`

### contract-compat-check
- `contract-compat-report.md`
- `contract-diff.json`

### e2e-execution-gate
- `e2e-execution-report.md`
- `e2e-artifacts-index.md`

### security-review-gate
- `security-gate-report.md`
- `security-findings.json`

### architecture-drift-review
- `architecture-drift-report.md`
- `drift-remediation-backlog.md`

## 4) Done Criteria (per skill)

1. `SKILL_SPEC v1.0` 11 bolum tam.
2. Decision rules "default + exception" modelinde.
3. Quality gate sayisal.
4. Handoff immutable artefakt listesi var.
5. En az 5 anti-pattern maddesi var.

## 5) Open Items (need user confirmation)

Tum open item'lar netlesti.

1. Canonical roller:
   - `Strategist (0), Analyst (1), Architect (2), PM (3), Designer (4), Developer (5), QA (6), DevOps (7), Investor (8)`
   - `User` Super Admin override yetkisine sahiptir.
   - `Viewer` read-only raporlama paydasi olarak opsiyoneldir.
2. Architect faz yonetimi:
   - Architect faz onerir (`MVP` veya `Scale/Prod`).
   - User override her zaman onceliklidir.
3. PM kapasite limiti:
   - `Must` kapsamı sprint backlog'un en fazla `%60`i.
4. UX breakpoint seti:
   - `375 / 768 / 1024 / 1440`.
5. Fullstack No-Go aksiyonu:
   - Ihlal tespitte otomatik `stop coding + violation report`.
6. QA critical path baseline:
   - `Auth & Security`, `Core Transaction`, `Revenue & Trust`.
7. DevOps prod approval:
   - Tek onay `User`.
   - AI once `Architect + DevOps pre-check` raporu sunar.
8. ROI debt formula:
   - `Technical Debt Ratio = refactor_effort / new_feature_effort`.
