---
name: idea-alchemist-market-strategist
description: Mature a raw idea into blueprint-ready strategy through problem framing, adversarial market analysis, naming/domain exploration, and business model options. Use when user provides a keyword/sentence idea and needs strategic shaping before architecture decisions.
---

# Purpose
Transform a raw idea into a decision-ready strategic brief.  
Force realistic risk checks before blueprint and implementation momentum begins.

# Trigger Rules
- Use when user gives a one-line idea, concept keyword, or vague product direction.
- Use before Blueprint when problem-solution fit is unclear.
- Use when naming, domain strategy, or competitor framing is requested.

# Required Inputs
Required:
- Raw idea statement (word/sentence)
- Target market hint (if known)
- Ecosystem constraint context (e.g., `boraeresici.com`, `eresici.com`)
- Artifact workspace root (default): `artifacts/YYYY-MM-DD/blueprint/`

Optional:
- Preferred region/language
- Pricing constraints
- Existing brand constraints

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.
- If idea is a single keyword, ask 3 quick clarifiers: `who is user`, `core pain`, `preferred market`.
- Ask if user wants broad exploration or constrained exploration (ecosystem-first).
- Ask preferred naming language and brand tone before generating name/domain options.

# Output Contract
- `artifacts/YYYY-MM-DD/blueprint/idea-brief.md`
  - Required headings: `Problem/Solution Fit`, `Target Persona`, `USP`, `Ghost Features`, `Risk Snapshot`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/blueprint/competitive-matrix.md`
  - Required headings: `Competitors`, `Positioning Gaps`, `Why This Might Fail`, `Countermoves`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/blueprint/brand-identity.md`
  - Required headings: `Name Options`, `Domain Options (.com/.io/.ai)`, `Ecosystem Fit`, `Selection Criteria`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/blueprint/business-model-canvas.md`
  - Required headings: `Revenue Model Options`, `Go-to-Market`, `Cost Drivers`, `Scale Path`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/blueprint/keyword-brain-map.md`
  - Required headings: `Seed Keywords`, `Semantic Clusters`, `Name Stems`, `Messaging Angles`, `SEO/Discovery Notes`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/blueprint/market-expectation-snapshot.md`
  - Required headings: `Demand Signals`, `Willingness-to-Pay Hypothesis`, `Buyer Objections`, `Adoption Barriers`, `Early Validation Plan`, `Next Skill`, `Suggested Command`

# Workflow
1. Clarify who has the problem and what pain is most expensive.
2. Expand idea into personas, USP, and core value loop.
3. Run adversarial analysis: why it may fail, who can crush it, and what moat is weak.
4. Build competitor matrix with direct, indirect, and substitute products.
5. Build keyword brain map, then generate naming and domain options with ecosystem-fit filter.
6. Produce monetization, market expectation, and growth pathways.
7. Publish blueprint-ready artifacts and handoff command.

# Decision Rules
Default:
- Start with skepticism and identify at least one meaningful risk.
- Prefer concise, testable assumptions over broad optimism.
- Keep suggestions compatible with existing ecosystem integration potential.
- Mark each major claim as `Observed`, `Inferred`, or `Assumption`.

No-Go:
- Start with praise-only framing (e.g., "great idea") without risks.
- Provide branding/domain suggestions disconnected from ecosystem constraints.
- Move to Architect step without problem-solution and competitor clarity.
- Provide domain recommendations without extension-fit rationale (trust, B2B, geo, regulation context).

Exception:
- If user explicitly requests pure brainstorming mode, mark risk validation as deferred but still document it.

# Quality Gates
- At least `1` concrete failure mode and mitigation per idea.
- At least `5` naming options and domain candidates.
- Competitive matrix includes both global and local/adjacent players where possible.
- Include at least `2` direct + `2` indirect competitors and at least `1` substitute behavior.
- Domain output includes `.com/.io/.ai` plus at least `2` context-fit alternatives (e.g., `.app`, `.health`, `.finance`).
- Include at least `5` keyword clusters in `keyword-brain-map.md`.
- Gate fail action: block handoff and request missing assumptions.

# Handoff Contract
Immutable artifacts passed to Loop Master and Architect:
- `artifacts/YYYY-MM-DD/blueprint/idea-brief.md`
- `artifacts/YYYY-MM-DD/blueprint/competitive-matrix.md`
- `artifacts/YYYY-MM-DD/blueprint/brand-identity.md`
- `artifacts/YYYY-MM-DD/blueprint/business-model-canvas.md`
- `artifacts/YYYY-MM-DD/blueprint/keyword-brain-map.md`
- `artifacts/YYYY-MM-DD/blueprint/market-expectation-snapshot.md`
- Key assumptions and unresolved risks list

# Anti-Patterns
- Motivational fluff without strategic challenge.
- Ignoring integration fit with existing ecosystem.
- Producing names without selection criteria.
- Treating all features as core without prioritization.
- Skipping monetization realism.

# Prompt Snippets
- `Idea Alchemist, bu fikri blueprint-oncesi olgunlastir ve risk odakli analiz et.`
- `Rakipler bu urunu nasil ezer? Karsilik stratejisiyle yaz.`
- `5-10 isim + .com/.io/.ai secenekleri ver, ecosystem-fit puanla.`
- `Tek kelimelik fikirden persona, rakip matrisi, keyword brain map ve domain stratejisi uret.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
