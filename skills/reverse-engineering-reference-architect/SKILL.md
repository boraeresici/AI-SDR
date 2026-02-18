---
name: reverse-engineering-reference-architect
description: Deconstruct reference repositories or architecture docs into evidence-backed architecture, data, API, process, and frontend patterns, then produce adaptation-ready inputs for Architect, PM, Developer, and DevOps without copy-paste reuse. Use when analyzing open-source or internal references to guide implementation decisions.
---

# Purpose
Turn external references into safe, reusable design intelligence for AI-SDR.  
Provide structured, evidence-based adaptation inputs before architecture or implementation decisions.

# Trigger Rules
- Use when user shares a repo URL, docs URL, or local reference project for analysis.
- Use when Architect/PM/Developer needs pattern extraction before Blueprint decisions.
- Use when a feature/module must be replicated conceptually without code copy.

# Required Inputs
Required:
- `reference_source` (`repo_url`, `docs_url`, or `local_path`)
- `license_type` (`MIT`, `Apache-2.0`, `GPL`, `LGPL`, etc.)
- `focus_modules` (e.g., `multi-calendar`, `auth-flow`)
- `target_stack` (default: `Django Ninja + Next.js`)
- `analysis_depth` (`quick` or `full`)
- `forbidden_actions` (`copy_paste_code=true`)
- Artifact workspace root (default): `artifacts/YYYY-MM-DD/research/`

Optional:
- Domain reference (`domains/<domain>.md`)
- Constraint themes (performance, security, compliance)
- Existing project architecture contract

# Input Completion Questions
- Ask for every missing item from `Required Inputs` before proceeding.
- If any required artifact path is missing, request an exact path under `artifacts/YYYY-MM-DD/<phase>/`.
- Stop-and-ask until all required inputs are complete; do not infer critical security or contract assumptions.
- Ask whether output should prioritize architecture-first, data-first, or integration-first analysis.
- Ask if license constraints require conceptual-only output.

# Output Contract
- `artifacts/YYYY-MM-DD/research/reference-architecture-analysis.md`
  - Required headings: `Scope`, `Technical Stack`, `Architecture Patterns`, `Infrastructure Patterns`, `Evidence Table`, `Confidence Notes`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/research/reference-data-blueprint.mmd`
  - Required content: Mermaid ERD + data-flow diagram with module-level labels.
- `artifacts/YYYY-MM-DD/research/reference-api-integration-map.md`
  - Required headings: `API Style`, `Endpoint Surface`, `Auth & Security Flow`, `Third-Party Integrations`, `Webhook/Async Contracts`, `Evidence Table`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/research/reference-gap-analysis.md`
  - Required headings: `Target vs Reference Delta`, `Do Directly`, `Adapt`, `Reject`, `Risk Notes`, `Evidence Table`, `Next Skill`, `Suggested Command`
- `artifacts/YYYY-MM-DD/research/reference-adaptation-pack.md`
  - Required headings: `Architect Adaptation Block`, `PM Adaptation Block`, `Developer Adaptation Block`, `DevOps Adaptation Block`, `Clean-Room Notes`, `Next Skill`, `Suggested Command`

# Workflow
1. Verify source accessibility and license constraints before deep analysis.
2. Extract architecture, data, API/integration, process/logic, and frontend patterns from selected modules.
3. For every finding, record `Evidence`, `Confidence`, and `Assumption`.
4. Run compatibility translation for target stack (`Django Ninja + Next.js` by default).
5. Classify each candidate pattern: `Do Directly`, `Adapt`, or `Reject`.
6. Perform gap analysis against current project constraints and domain redlines.
7. Create `artifacts/YYYY-MM-DD/research/` if missing and write all output files physically.
8. Publish handoff package only after file-write and completeness verification.

# Decision Rules
Default:
- Use evidence-backed reasoning for all major claims.
- Prefer conceptual adaptation over implementation cloning.
- Keep output role-targeted and directly actionable.
- Prioritize modular adaptation that can start as monolith modules and later split into microservices with minimal rewrite.
- Include scaling and cost impact notes for every recommended adoption path.

No-Go:
- Copy/paste reference code into output artifacts.
- Derive code-level structures from GPL/LGPL references when policy is conceptual-only.
- Produce adaptation advice without evidence references.
- Return analysis only in chat without writing files under `artifacts/YYYY-MM-DD/research/`.

Exception:
- If source access is partial, continue only with explicit assumptions and lower confidence labels.

# Quality Gates
- Output file presence: `5/5` files exist under `artifacts/YYYY-MM-DD/research/`.
- Every major finding includes `Evidence`, `Confidence`, and `Assumption`.
- Classification coverage: each key pattern must be labeled `Do Directly`, `Adapt`, or `Reject`.
- License compliance rule is explicitly documented in `reference-gap-analysis.md`.
- Adaptation pack includes reusable-module candidates for cross-project use.
- Gate fail action: block handoff and return missing evidence/compliance items.

# Handoff Contract
Immutable artifacts passed to Loop Master, Architect, PM, Developer, and DevOps:
- `artifacts/YYYY-MM-DD/research/reference-architecture-analysis.md`
- `artifacts/YYYY-MM-DD/research/reference-data-blueprint.mmd`
- `artifacts/YYYY-MM-DD/research/reference-api-integration-map.md`
- `artifacts/YYYY-MM-DD/research/reference-gap-analysis.md`
- `artifacts/YYYY-MM-DD/research/reference-adaptation-pack.md`
- Explicit license handling and provenance notes

# Handoff Validation Checklist
- Verify every file listed under Output Contract exists at the declared artifact path.
- Verify each markdown output includes Next Skill and Suggested Command.
- Verify gate decision (PASS/BLOCK/NO-GO) is explicit in handoff artifacts.
- Verify unresolved risks and owner/action are recorded before handoff.

# Anti-Patterns
- Treat reference architecture as universally optimal.
- Ignore target-stack incompatibility and domain constraints.
- Hide low-confidence assumptions as facts.
- Present adaptation without role ownership.
- Confuse conceptual pattern extraction with code reuse.

# Prompt Snippets
- Standalone template: <Skill>, [goal/scope] icin standalone mode calistir. Inputs: [artifact1], [artifact2]. Output path: artifacts/YYYY-MM-DD/<phase>/.
- `Reverse Engineering, [reference_source] icin full mode calistir; focus_modules=[...], target_stack=[...].`
- `Extract multi-calendar module patterns and prepare Architect + Developer adaptation blocks.`
- `Run license-aware gap analysis and block code-level reuse if policy requires conceptual-only output.`

# Spec Compatibility
This skill follows SKILL_SPEC v1.0.
Skill Version: v1.0.0
