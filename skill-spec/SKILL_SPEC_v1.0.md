# SKILL_SPEC v1.0

Bu dokuman, tum skill dosyalari icin canonical formati tanimlar.

## 1) Frontmatter (zorunlu)

Her `SKILL.md` su YAML frontmatter ile baslar:

```yaml
---
name: skill-name
description: Skill'in ne yaptigi ve hangi tetikleyicilerde kullanilacagi.
---
```

Kurallar:
- Sadece `name` ve `description` kullan.
- `name`: kucuk harf, rakam, tire.
- `description`: hem kapsam hem "when to use" tetikleyicilerini icersin.

## 2) Body Sections (zorunlu siralama)

Her skill govdesinde su bolumler bulunur:

1. `Purpose`
2. `Trigger Rules`
3. `Required Inputs`
4. `Output Contract`
5. `Workflow`
6. `Decision Rules`
7. `Quality Gates`
8. `Handoff Contract`
9. `Anti-Patterns`
10. `Prompt Snippets`
11. `Spec Compatibility`

## 3) Section Contracts

### Purpose
- 2-4 satir.
- Skill'in sorumluluk sinirini net tanimla.

### Trigger Rules
- Test edilebilir ifadelere yaz.
- En az 3 tipik trigger cumlesi ver.

### Required Inputs
- `Required` ve `Optional` olarak ayir.
- Eksik zorunlu girdi varsa skill "stop-and-ask" yapar.

### Output Contract
- Ciktiyi dosya adi + format + zorunlu basliklar ile tanimla.
- Ornek: `artifacts/YYYY-MM-DD/blueprint/decision-matrix.md`, `artifacts/YYYY-MM-DD/hardening/test-plan.md`.
- Kural: Projeye ozel ciktilar `skills/` altina yazilmaz; her zaman proje kokundeki `artifacts/...` altina yazilir.
- Kural: Tum markdown ciktilarinin sonunda `Next Skill` ve `Suggested Command` basliklari bulunur.

### Workflow
- Sirali adimlar (minimum 4, maksimum 9).
- Her adim sonunda olculebilir ara cikti belirt.

### Decision Rules
- "Default + Exception" modeli kullan.
- Sert kurallar `No-Go` olarak ayrica etiketlenir.

### Quality Gates
- Gecis esiklerini sayisal yaz.
- Gate fail durumunda hangi faza donulecegi yazilir.

### Handoff Contract
- Bir sonraki skill'e aktarilacak immutable artefaktlari listele.
- Handoff olmadan faz gecisi yapilamaz.

### Anti-Patterns
- Skill'in yapmamasi gereken 5-10 madde.

### Prompt Snippets
- Model bagimsiz kisa komutlar.
- En az bir "strict mode" snippet'i ekle.

### Spec Compatibility
- Satir formati:
  - `This skill follows SKILL_SPEC v1.0.`

## 4) Versioning Policy

- Bu dokuman canonical spec'tir.
- Minor (`v1.x`): geriye uyumlu ekleme.
- Major (`v2.0`): section sirasi/sozlesmesi degisirse.
- Her skill body sonunda uyum satiri zorunludur.

## 5) Validation Checklist

Her skill icin yayindan once:
1. Frontmatter yalnizca `name` + `description` mu?
2. 11 zorunlu bolum eksiksiz mi?
3. Trigger ve output test edilebilir mi?
4. Quality gate sayisal mi?
5. Handoff immutable artefaktlari net mi?
6. En az 1 `No-Go` kurali var mi?
