# AI-SDR User Guide

Bu rehber, AI-SDR skill'lerinin hangi sirayla ve hangi cumle kaliplariyla kullanilacagini aciklar.

## 1) Hızlı Başlangıç Akışı

1. `idea-alchemist-market-strategist` ile ham fikri olgunlastir.
2. `loop-master-orchestrator` ile sureci baslat ve domain secimi yap.
3. `architect-decision-matrix` ile 2+ opsiyon ve onay al.
4. `pm-context-scope` ile scope/AC/DoD paketini kilitle.
5. `ux-design-system` ile UI kisitlarini netlestir.
6. `fullstack-implementation-refactor` ile implement et.
7. `qa-quality-gates` ile kalite kapilarini gec.
8. Hardening icinde sirayla:
   - `contract-compat-check`
   - `e2e-execution-gate`
   - `security-review-gate`
9. `devops-deployment-stability` ile release readiness kontrol et.
10. `roi-investor-check` ile go/no-go karari ver.
11. Release sonrasi `architecture-drift-review` calistir.

## 2) Faz Bazlı Kullanım

### Blueprint Loop
- Skilller: `idea-alchemist-market-strategist`, `loop-master-orchestrator`, `architect-decision-matrix`, `pm-context-scope`
- Cikti: onayli kontrat + scope paketi
- Not: Loop Master bu fazin basinda `Domain Constraint Pre-check` calistirir.

### Build Loop
- Skilller: `ux-design-system`, `fullstack-implementation-refactor`
- Cikti: kod + kalite notlari

### Hardening Loop
- Skilller: `qa-quality-gates`, `contract-compat-check`, `e2e-execution-gate`, `security-review-gate`, `devops-deployment-stability`
- Cikti: release readiness + approval

### Post-Release
- Skilller: `roi-investor-check`, `architecture-drift-review`
- Cikti: ticari karar + drift remediation backlog

## 3) Ornek Kullanım Cumleleri

### Orkestrasyon
- `Loop Master, yeni ozellik icin Blueprint Loop'u strict mode baslat. Domain: domains/INDEX.md uzerinden sec.`
- `Loop Master, su anki fazi degerlendir ve gate pass/block kararini ver.`

### Fikir Olgunlastirma
- `Idea Alchemist, [fikir] icin problem-fit, rakip matrisi, isim/domain ve is modeli ciktilari uret.`
- `Bu fikir neden tutmaz? Rakipler nasil ezer? Karsi stratejiyi yaz.`

### Mimari Karar
- `Architect, MVP modu icin 2 opsiyonlu decision matrix cikar ve onay iste.`
- `Architect, Scale/Prod moduna gec ve agirliklari yeniden hesapla.`

### Scope ve PM
- `PM, bu ozelligi MoSCoW ile parcala ve Must oranini %60 altinda tut.`
- `PM, her Must maddesi icin AC ve DoD olustur.`

### UX/UI
- `Designer, bu akisa gore ui-constraints.md uret; WCAG 2.1 AA zorunlu.`
- `Designer, 375/768/1024/1440 breakpoint dogrulama listesi ver.`

### Implementation
- `Developer, implementation strict mode calistir; No-Go ihlalinde durdur.`
- `Developer, business logic'i view/component disina tasiyarak refactor et.`

### QA
- `QA, critical path testlerini calistir ve quality-gate-report.md uret.`
- `QA, coverage >= %70 ve lint=0 sartlarini dogrula.`

### Contract Check
- `Contract check, mevcut ve onceki OpenAPI farklarini kirici degisiklik icin denetle.`

### E2E Gate
- `E2E gate, staging'de critical senaryolari calistir ve artifact index uret.`

### Security Gate
- `Security gate strict mode calistir; HIGH/CRITICAL bulgu varsa release'i blokla.`

### DevOps Release
- `DevOps, release-readiness raporunu ve migration-risk-note dosyasini hazirla.`
- `DevOps, production apply icin SQL diff ile user onayi iste.`

### ROI ve Drift
- `Investor check, debt ratio ve infra cost metrikleriyle go/no-go ver.`
- `Architecture drift review, baseline'e gore sapmalari analiz et ve remediation backlog cikar.`

## 4) Kullanım Kuralları

- Build'e gecmeden once Blueprint artefaktlari eksiksiz olmalidir.
- Hardening gate'lerinden biri fail olursa release durdurulmalidir.
- Prod migration sadece user onayi ile uygulanmalidir.
- Tum skill ciktilari immutable referans olarak bir sonraki faza aktarilmalidir.
- Artifact dosyalari `skills/` altina yazilmaz; proje kokunde `artifacts/` altina yazilir.

## 4.1) Artifact Dizin Standardi

Bu klasor yapisi, skill'lerin farkli projelerde tekrar kullanilabilmesi icin zorunludur:

```text
artifacts/
  YYYY-MM-DD/
    blueprint/
    build/
    hardening/
    release/
    post-release/
```

Not:
- `skills/` sadece reusable skill tanimlarini tutar.
- Projeye ozel ciktilar her zaman `artifacts/...` altina gider.

## 5) Minimal Trigger Seti

- Baslatma: `Blueprint Loop'u baslat`
- Build: `Build Loop'a gec`
- Hardening: `Hardening gate'lerini calistir`
- Release: `Prod onayi surecini baslat`
- Post-release: `Drift review ve ROI check calistir`

## 6) Quick Commands (Copy-Paste)

1. `Idea Alchemist, [fikir/ozet] icin strategy mode calistir; idea-brief, competitive-matrix, brand-identity ve business-model-canvas uret.`
2. `Loop Master, [fikir/özellik/dosya adı] için Blueprint Loop'u strict mode başlat. Domain: [domains/*.md]. Hedef: [...]. Kapsam: [...]. Başarı metriği: [...].`
   Ornek:
   `Loop Master, 60 yaş üstü için hayatı kolaylaştıracak uygulama fikri için Blueprint Loop'u strict mode başlat. Domain: domains/senior-care.md. Hedef: kullanımı kolay, anlaşılır bir uygulama olması ve 60 yaş üstünün rahat kullanabilmesi. Kapsam: ilaç hatırlatma, doktor randevu takibi, acil durumda tek tuşla yakına haber verme, büyük yazı tipi ve sesli yönlendirme. Başarı metriği: 4 hafta içinde pilot kullanıcıların en az %70'i temel görevleri (hatırlatma kurma, randevu ekleme, acil arama) yardımsız tamamlayabilmeli; görev tamamlama süresi ortalama 2 dakikanın altında olmalı; memnuniyet skoru en az 4/5 olmalı.`
3. `Architect, [özellik adı] için MVP modu bazlı 2 seçenekli decision matrix hazırla ve Onaylıyor musunuz diye sor.`
4. `PM, [özellik adı] için scope-pack oluştur; MoSCoW uygula ve Must oranını %60 altında tut.`
5. `Designer, [ekran/akış adı] için ui-constraints üret; WCAG 2.1 AA ve 375/768/1024/1440 breakpoints zorunlu olsun.`
6. `Developer, [modül/feature adı] için implementation strict mode çalıştır; No-Go ihlali varsa kodlamayı durdur ve raporla.`
7. `QA, [feature/release] için quality gate çalıştır; critical path %100, coverage >= %70, lint 0 hedefini doğrula.`
8. `Contract check, [servis/versiyon] için mevcut sürümü önceki OpenAPI ile karşılaştır ve breaking change varsa blokla.`
9. `E2E gate, [ortam] ortamında [critical/smoke] senaryoları çalıştır ve artifact index üret.`
10. `Security gate, [release adı] için strict mode çalıştır; HIGH veya CRITICAL bulgu varsa release'i blokla.`
11. `DevOps, [release adı] için release-readiness ve migration-risk-note hazırla; production apply için SQL diff ile onay iste.`
12. `Investor check, [feature/release] için infra cost ve technical debt ratio ile go/no-go kararı üret.`
13. `Architecture drift review, [release/sprint] sonrası sapmaları analiz et ve remediation backlog çıkar.`

## 7) Standalone Skill Calistirma

Skill'ler gerektiğinde tek basina da calistirilabilir. Bu modda ilgili skill'in `Required Inputs` listesi dogrudan komuta eklenmelidir.

### Standalone Komut Kalibi

`[Skill], [hedef/kapsam] icin standalone mode calistir. Inputs: [dosya1], [dosya2], ...`

### Standalone Ornekler

1. `Security gate, mevcut release adayi icin standalone mode calistir. Inputs: artifacts/2026-02-17/blueprint/api-contract.yaml, artifacts/2026-02-17/build/pr-quality-notes.md. HIGH/CRITICAL bulgu varsa release'i blokla ve security-gate-report.md uret.`
2. `Contract check, standalone mode calistir. Inputs: artifacts/2026-02-17/blueprint/api-contract.yaml ve onceki OpenAPI baseline. Breaking change varsa raporla ve blokla.`
3. `QA, standalone mode calistir. Inputs: artifacts/2026-02-17/build/implementation-plan.md, artifacts/2026-02-17/build/pr-quality-notes.md. quality-gate-report taslagi olustur.`
4. `E2E gate, standalone mode calistir. Inputs: staging ortami, critical selector ve scenario path. e2e-execution-report.md uret.`
5. `DevOps, standalone mode calistir. Inputs: artifacts/2026-02-17/hardening/quality-gate-report.md, migration plan. release-readiness.md ve migration-risk-note.md uret.`
6. `Architecture drift review, standalone mode calistir. Inputs: artifacts/2026-02-17/blueprint/architecture-contract.md ve mevcut modul/dependency haritasi. drift raporu ve backlog uret.`

### Standalone Mode Notlari

- Standalone run, diger fazlarin tamamlandigini varsaymaz.
- Eksik input varsa skill block/ask davranisiyla ek bilgi ister.
- Cikti dosyalari yine `artifacts/YYYY-MM-DD/<phase>/` altina yazilir.
