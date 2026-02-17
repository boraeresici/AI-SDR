# Domain Expectations - EdTech

## Document Version
- Version: `v1.0.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Learning continuity and accessibility override non-critical feature expansion.

## Domain Context
- Learner, instructor, and guardian workflows
- Goal: measurable learning progress with inclusive user experience

## Regülasyon Katmanı
- Student data privacy must comply with relevant regional regulations.
- Minor/student records require stricter access control and retention policies.

Rule for AI-SDR:
- Security outputs must include role-based scope and content access restrictions.

## Persona Katmanı
- Learner persona: varied digital literacy and accessibility needs.
- Instructor persona: progress visibility and intervention controls.

Rule for AI-SDR:
- UX and PM outputs must include accessibility and low-friction learning paths.

## Hata Tolerans Katmanı
- If session drops for up to 10s, learning progress and draft answers must be preserved.
- Sync conflicts must not overwrite learner progress silently.

Rule for AI-SDR:
- QA/E2E must include resume-from-interruption scenarios.

## Definition of Success
- Learning progress persistence under transient failures
- Accessible core flows for diverse learner profiles
- Instructor actions remain auditable and reversible

Rule for AI-SDR:
- Release blocks when progress-loss risk is not mitigated.
