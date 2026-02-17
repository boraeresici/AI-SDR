# Changelog

All notable changes to AI-SDR docs/specs/skills are listed here.

## [Unreleased]

### Added

- `CONTRIBUTING.md` for contribution flow, PR format, and commit conventions.
- `CODE_OF_CONDUCT.md` for community behavior standards.
- `SECURITY.md` for vulnerability reporting and disclosure process.
- `CHANGELOG.md` for visible change history.

### Changed

- `README.md` includes simulation status and artifact policy references.
- Skill output contracts include `Next Skill` and `Suggested Command` continuity fields.
- All skills now include:
  - `Standalone template` prompt snippet
  - `Handoff Validation Checklist`
  - `Skill Version: v1.1.0` marker in `Spec Compatibility`
- Hardening skills now require domain pre-check evidence in standalone mode.
- Domain section labels were normalized to English canonical names:
  - `Regulation Layer`
  - `Persona Layer`
  - `Failure Tolerance Layer`
- Added multi-provider agent manifests across all skills:
  - `agents/manifest.yaml`
  - `agents/openai.yaml`
  - `agents/claude.yaml`
  - `agents/gemini.yaml`
