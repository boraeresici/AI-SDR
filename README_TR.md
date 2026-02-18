# AI-SDR (Software Development Runtime)

English version: [`README.md`](./README.md)  
Direct URL: <https://github.com/boraeresici/AI-SDR/blob/main/README.md>

[![Repo](https://img.shields.io/badge/Repo-AI--SDR-0A66C2?logo=github)](https://github.com/boraeresici/AI-SDR)
[![Branch](https://img.shields.io/badge/Branch-main-2EA44F)](https://github.com/boraeresici/AI-SDR/tree/main)
[![Skill Spec](https://img.shields.io/badge/SKILL__SPEC-v1.0-6f42c1)](skill-spec/SKILL_SPEC_v1.0.md)
[![Skills](https://img.shields.io/badge/Skills-14-orange)](skills)
[![A11y](https://img.shields.io/badge/WCAG-2.1_AA-005A9C)](https://www.w3.org/WAI/WCAG21/quickref/)
[![QA Gate](https://img.shields.io/badge/Coverage-%3E%3D70%25-brightgreen)](skills/qa-quality-gates/SKILL.md)
[![Simulation](https://img.shields.io/badge/Simulation-Completed-2EA44F)](#simulation-status)
[![Process Flow](https://img.shields.io/badge/Process_Test-PASS-2EA44F)](#simulation-status)
[![Production Readiness](https://img.shields.io/badge/Production-NO--GO_(Simulation)-D93025)](#simulation-status)

AI-SDR, vibe coding hizini korurken SDD (Software Design Document) disiplinini zorunlu kilan skill tabanli bir runtime yaklasimidir.

## Simulation Status

- E2E process simulasyonu `2026-02-17` tarihinde tamamlandi.
- Process orkestrasyon dogrulamasi: `PASS`.
- Simulasyon kosusunda production karari: `NO-GO` (runtime kontroller beklemede).

## Proje Amaci

- Faz gecislerini kontrol etmek: `Blueprint -> Build -> Hardening`
- Mimari, kapsam, UX, kalite, operasyon ve ROI kararlarini gate modeliyle kilitlemek
- "hizli teslimat + dusuk teknik borc + olculebilir cikti" standardi kurmak
- `Modular monolith` yaklasimi ile baslayip, olcek/maliyet guardrail'leriyle planli microservice gecis yollari tanimlamak
- Commodity alanlarda (auth, notification, payment) `buy-over-build` yaklasimi ve kontrollu dependency yonetimi uygulamak

## Skill Ekosistemi

- `skills/loop-master-orchestrator/SKILL.md`
- `skills/idea-alchemist-market-strategist/SKILL.md`
- `skills/reverse-engineering-reference-architect/SKILL.md`
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

## Canonical Standartlar

- Skill format standardi: `skill-spec/SKILL_SPEC_v1.0.md`
- Refactor plani: `skill-spec/SKILL_REFACTOR_PLAN_v1.md`
- Skill iyilestirme backlog'u: `skill-spec/SKILL_IMPROVEMENT_BACKLOG.md`
- Coklu provider skill manifestleri: `skills/*/agents/{manifest,openai,claude,gemini}.yaml`
- Surec diyagrami (render): `process.md`
- Surec kaynagi: `process.mmd`
- Kullanim rehberi: `USERGUIDE.md`
- Standalone skill kullanimi: `USERGUIDE.md` (`Standalone Skill Calistirma`)
- Artifact yazim standardi: `artifacts/YYYY-MM-DD/<phase>/`
- Lokal dogrulama: `bash scripts/validate-skills.sh`

## Repo Yapisi

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
│       ├── research/
│       ├── blueprint/
│       ├── build/
│       ├── hardening/
│       ├── release/
│       └── post-release/
├── domains
├── skill-spec
├── templates
└── skills
    └── <skill-name>/agents/{manifest,openai,claude,gemini}.yaml
```

## Surec Ozeti

1. Fikir Olgunlastirma:
   - `Idea Alchemist & Market Strategist` ham fikri stratejiye hazirlar.
2. Research Loop (Opsiyonel):
   - `Reverse Engineering & Reference Architect` referans repo/dokumanlari deconstruct ederek uyarlama paketleri uretir.
3. Blueprint Loop:
   - Loop Master, `domains/INDEX.md` + secili domain dokumani ile `Domain Constraint Pre-check` calistirir.
   - Domain redline fail olursa surec `BLOCK` olur.
4. Build Loop:
   - Designer + Developer kisitli ve denetlenebilir sekilde uygular.
5. Hardening Loop:
   - QA + Contract + E2E + Security + DevOps gate'leri tamamlanir.
6. ROI + Drift:
   - ROI karari ve release sonrasi mimari sapma kontrolu yapilir.

## Mimari Prensipler

- FE/BE secimi trendle degil olculebilir performans ve operasyon maliyetiyle yapilir.
- Commodity yeteneklerde once kendini kanitlamis kutuphane/servis tercih edilir; custom kod gerekcesi yazilir.
- Her yeni dependency icin security, maintenance, performance ve lock-in etkisi dokumante edilir.

## Process Diagram

- Render dosyasi: `process.md`
- GitHub'da ac: [process.md](./process.md)

## Artifact Policy

- `skills/` altina proje-cikti yazilmaz.
- Ciktilar `artifacts/YYYY-MM-DD/<phase>/` altina yazilir.
- Loop Master faz gecislerinde gerekli artifact varligini kontrol eder.

## Project Docs

- Katki rehberi: `CONTRIBUTING.md`
- Davranis kurallari: `CODE_OF_CONDUCT.md`
- Guvenlik politikasi: `SECURITY.md`
- Degisim gunlugu: `CHANGELOG.md`
- Skill validation workflow: `.github/workflows/validate-skills.yml`

## Templates

- `templates/decision-matrix.md`
- `templates/scope-pack.md`
- `templates/quality-gate-report.md`

## Domains

- `domains/INDEX.md` (aktif domain dokumanlari + versiyonlari)
- `domains/senior-care.md`
- `domains/smb-booking.md`
- `domains/healthtech-senior-care.md`
- `domains/fintech-defi.md`
- `domains/saas-productivity.md`
- `domains/martech-customer-analytics.md`
- `domains/edtech.md`

## 5 Dakikada Baslangic

1. Blueprint baslat:
   - `Loop Master, [fikir] icin Blueprint Loop'u strict mode baslat. Domain: [domains/*.md]. Hedef: [...]. Kapsam: [...]. Basari metrigi: [...].`
2. Mimari karar:
   - `Architect, MVP icin 2 opsiyonlu decision matrix ve ilk API/Auth/Data kontratini uret.`
3. Kapsami kilitle:
   - `PM, scope-pack olustur; MoSCoW uygula ve Must <= %60 kuralini koru.`
4. UI kisitlarini uret:
   - `Designer, ui-constraints uret; WCAG 2.1 AA ve 375/768/1024/1440 breakpoints zorunlu olsun.`
5. Akişi devam ettir:
   - `Developer -> QA -> Contract -> E2E -> Security -> DevOps -> ROI -> Drift`

## License

Bu repo `MIT` lisansi ile yayinlanmistir. Detaylar icin `LICENSE` dosyasina bakin.
