# Domain Expectations - Senior Care

## Document Version
- Version: `v2.1.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Enforce this policy across Architect, PM, Developer, QA, Security, and DevOps outputs.

## Domain Context
- Target users: 60+ senior users and caregivers
- Primary goal: low-friction daily support with high trust and reliability

## Regulation Layer
- Health-related personal data must follow regional health/privacy regulations (e.g., KVKK/GDPR equivalents).
- Sensitive health data must be encrypted at rest and in transit.

Rule for AI-SDR:
- Architect and DevOps must include encryption, retention, and access logging controls by default.

## Persona Layer
- Primary persona: 70+ senior user with limited digital confidence.
- Secondary persona: caregiver with urgent-response responsibility.

Rule for AI-SDR:
- UX and PM outputs must optimize readability, low step-count flows, and explicit guidance.

## Failure Tolerance Layer
- If network is offline for up to 10 seconds, critical actions (especially SOS) must be queued locally with timestamp.
- When connectivity returns, queued SOS event must be transmitted immediately.

Rule for AI-SDR:
- QA and E2E plans must include offline/online transition tests for critical paths.

## Definition of Success
- Business Logic Constraints:
  - A caregiver can be linked to a maximum of 3 senior users.
- Critical Failures:
  - SOS signal delivery later than 5 seconds is a system failure.
- KPI Baselines:
  - Assisted-free core-task success >= 70%
  - Median core-task completion < 2 minutes
  - Satisfaction score >= 4/5

Rule for AI-SDR:
- Treat caregiver-limit and SOS latency as hard acceptance constraints.

## Glossary & Taxonomy
- `Caregiver`: authorized role with managed access to linked senior profiles.
- `Relative`: relation label; may be represented as caregiver only if authorized.
- `Notify`: push by default; SMS fallback for SOS-critical path.

Rule for AI-SDR:
- Reject ambiguous terms in contracts; map each term to explicit model/behavior.

## No-Go List
- Never request critical SOS confirmation inside blocking modal/pop-up flows.
- Never log senior sensitive data without anonymization/redaction.
- Never hide SOS trigger behind nested navigation.

Rule for AI-SDR:
- If any No-Go is detected, block phase transition and require redesign.

## Domain Constraints & Edge Cases
- Physical constraints: enforce WCAG AAA on critical surfaces.
- Urgency constraint: SOS action must be one-tap visible from home.

Rule for AI-SDR:
- Add AAA checks and one-tap SOS visibility verification to UX/QA outputs.

## Integration Rules
- External APIs: pharmacy integration only from approved provider list.
- Auditability: emergency events must be traceable end-to-end.

Rule for AI-SDR:
- Require immutable event IDs and audit logs for SOS flows.

## Quality Gate Priorities
- Auth/SOS critical path coverage: 100%
- Security gate: no unresolved high/critical findings
- Accessibility gate: critical screens meet AAA contrast/readability

Rule for AI-SDR:
- Hardening phase must block release if any priority gate fails.
