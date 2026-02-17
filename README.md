# AI-SDR (Software Development Runtime)

[![Repo](https://img.shields.io/badge/Repo-AI--SDR-0A66C2?logo=github)](https://github.com/boraeresici/AI-SDR)
[![Branch](https://img.shields.io/badge/Branch-main-2EA44F)](https://github.com/boraeresici/AI-SDR/tree/main)
[![Skill Spec](https://img.shields.io/badge/SKILL__SPEC-v1.0-6f42c1)](skill-spec/SKILL_SPEC_v1.0.md)
[![Skills](https://img.shields.io/badge/Skills-12-orange)](skills)
[![A11y](https://img.shields.io/badge/WCAG-2.1_AA-005A9C)](https://www.w3.org/WAI/WCAG21/quickref/)
[![QA Gate](https://img.shields.io/badge/Coverage-%3E%3D70%25-brightgreen)](skills/qa-quality-gates/SKILL.md)
[![Simulation](https://img.shields.io/badge/Simulation-Completed-2EA44F)](#simulation-status)
[![Process Flow](https://img.shields.io/badge/Process_Test-PASS-2EA44F)](#simulation-status)
[![Production Readiness](https://img.shields.io/badge/Production-NO--GO_(Simulation)-D93025)](#simulation-status)

AI-SDR (Software Development Runtime), vibe coding hizini korurken SDD (Software Design Document) disiplinini zorunlu kilan skill tabanli bir runtime yaklasimidir. Sistem, rol bazli skill'leri orchestrate ederek fikirden canliya gecisi kontrol eder.

## Simulation Status

- E2E process simulation run completed on `2026-02-17`.
- Process orchestration validation: `PASS`.
- Production release decision in simulation run: `NO-GO` (runtime checks pending).

## Proje Amaci

- Faz gecislerini kontrol etmek: `Blueprint -> Build -> Hardening`
- Mimari, scope, UX, kalite, operasyon ve ROI kararlarini gate modeliyle kilitlemek
- "Hizli kod + dusuk borc + olculebilir cikti" dengesini standardize etmek

## Skill Ekosistemi

- `skills/loop-master-orchestrator/SKILL.md`
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

### Skill Ozetleri (Tek Cumle)

- `loop-master-orchestrator`: Faz gecislerini yonetir, gate kontrollerini uygular ve gerekirse rollback karari verir.
- `architect-decision-matrix`: En az iki mimari opsiyonu agirlikli skorlayarak user onayina sunar.
- `pm-context-scope`: Scope'u MoSCoW ile netlestirir, AC/DoD uretir ve `Must <= %60` kuralini korur.
- `ux-design-system`: UI kararlarini token, responsive ve WCAG 2.1 AA kurallariyla standardize eder.
- `fullstack-implementation-refactor`: Kod uretimini mimari ve kalite kisitlariyla uygular, No-Go ihlalinde kodlamayi durdurur.
- `qa-quality-gates`: Kritik akis testleri, coverage ve lint kapilariyla release hazirligini olcer.
- `devops-deployment-stability`: Release/migration riskini denetler ve production icin manuel user onayi zorunlu kilir.
- `roi-investor-check`: Teknik ciktinin ticari etkisini metriklerle degerlendirip go/no-go karari uretir.
- `contract-compat-check`: FE/BE API uyumlulugunu kontrol eder ve kirici degisiklikleri release oncesi bloklar.
- `e2e-execution-gate`: Kritik E2E senaryolarini calistirir, artifact toplar ve fail durumunda release'i durdurur.
- `security-review-gate`: Guvenlik bulgularini siddet bazli siniflandirir ve yuksek/kritik riskte release'i engeller.
- `architecture-drift-review`: Release sonrasi mimari sapmalari tespit eder ve duzeltme backlog'unu zorunlu kilar.

## Canonical Standartlar

- Skill format standardi: `skill-spec/SKILL_SPEC_v1.0.md`
- Refactor plani: `skill-spec/SKILL_REFACTOR_PLAN_v1.md`
- Surec diyagrami (render): `process.md`
- Surec kaynagi: `process.mmd`
- Kullanim rehberi: `USERGUIDE.md`
- Standalone skill kullanimi: `USERGUIDE.md` icinde `Standalone Skill Calistirma`
- Artifact yazim standardi: `artifacts/YYYY-MM-DD/<phase>/`

## Cleanup Sonrasi Repo Yapisi

```text
.
├── README.md
├── process.md
├── process.mmd
├── artifacts
│   └── YYYY-MM-DD
│       ├── blueprint/
│       ├── build/
│       ├── hardening/
│       ├── release/
│       └── post-release/
├── skill-spec
│   ├── SKILL_SPEC_v1.0.md
│   └── SKILL_REFACTOR_PLAN_v1.md
└── skills
    ├── architect-decision-matrix/
    ├── architecture-drift-review/
    ├── contract-compat-check/
    ├── devops-deployment-stability/
    ├── e2e-execution-gate/
    ├── fullstack-implementation-refactor/
    ├── loop-master-orchestrator/
    ├── pm-context-scope/
    ├── qa-quality-gates/
    ├── roi-investor-check/
    ├── security-review-gate/
    └── ux-design-system/
```

## Process (Ozet)

1. Blueprint Loop:
   - Strategist, Analyst, Architect, PM tarafindan immutable kontratlar uretilir.
2. Build Loop:
   - Designer + Developer implement eder, No-Go ihlallerinde loop durur.
3. Hardening Loop:
   - QA sonrasi Contract Check, E2E Gate ve Security Gate zorunlu calisir.
   - Contract fail ise Blueprint'e, E2E/Security fail ise Build'e geri donulur.
   - DevOps pre-check tamamlanmadan prod onayi istenmez.
4. ROI Gate:
   - Teknik cikti is sonucuna baglanir, go/no-go karari verilir.
5. Runtime Drift Gate:
   - Production sonrasi architecture drift kontrol edilir; sapma varsa yeniden Blueprint fazina donulur.
6. Trigger Mapping:
   - `agent-map.yaml` benzeri routing dis dosyada degil, `loop-master-orchestrator` icine gomulu source-of-truth olarak tutulur.

## Process Diagram

- Repo ici referans (render): `process.md`
- GitHub'da ac: [process.md](./process.md)
- Yeni sekmede ac: <a href="https://github.com/boraeresici/AI-SDR/blob/main/process.md" target="_blank" rel="noopener noreferrer">Process Diagram (GitHub)</a>

## Artifact Policy

- Skill tanimlari reusable oldugu icin `skills/` altina proje-cikti dosyasi yazilmaz.
- Tanimlanan tum faz ciktilari proje kokundeki `artifacts/YYYY-MM-DD/<phase>/` altina yazilir.
- Loop Master her faz gecisinde bu klasorde required artifact varligini dogrular.

## Kritik Karar Kurallari

- Build'e gecis icin minimum artefakt: API Contract + DoD + Auth Scheme + Data Schema
- PM onceliklendirme: MoSCoW (Must <= %60)
- UX: WCAG 2.1 AA + breakpoints `375/768/1024/1440`
- Fullstack No-Go: `any`, type hint eksigi, business logic layer ihlali, N+1
- QA Gate: Critical path %100, genel coverage >= %70, lint 0
- Contract Gate: FE/BE contract uyumsuzlugu `0`
- E2E Gate: Critical senaryolarda fail `0`
- Security Gate: yuksek/kritik acik varken release bloklanir
- DevOps: Staging auto; Production migration manuel user onayi + SQL diff
- ROI: `Technical Debt Ratio = refactor_effort / new_feature_effort`

## Referans URL'ler

- Proje reposu: https://github.com/boraeresici/AI-SDR
- OpenAPI: https://www.openapis.org/
- JSON Schema: https://json-schema.org/
- Mermaid: https://mermaid.js.org/
- WCAG 2.1 AA: https://www.w3.org/WAI/WCAG21/quickref/
- MoSCoW Prioritization: https://www.productplan.com/glossary/moscow-prioritization/

## Kullanım Notu

Yeni skill eklerken veya mevcut skill guncellerken `skill-spec/SKILL_SPEC_v1.0.md` section contract'larina birebir uyulmalıdır.
