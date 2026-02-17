# Domain Expectations - HealthTech & Senior Care

## Document Version
- Version: `v1.0.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Domain constraints override generic defaults in all phases.

## Domain Context
- Hybrid domain: healthcare operations for elderly users
- Goal: safe, understandable, and compliant care-support experiences

## Regülasyon Katmanı
- Healthcare workflows must align with medical data privacy requirements (HIPAA-like + KVKK/GDPR context).
- Access to health data must be role-based and auditable.

Rule for AI-SDR:
- Security and DevOps outputs must include audit trail and access-control evidence.

## Persona Katmanı
- Senior persona: 70+ with reduced motor/vision capability.
- Care team persona: caregiver/relative with emergency duties.

Rule for AI-SDR:
- UX must prioritize large touch targets, high contrast, and plain language.

## Hata Tolerans Katmanı
- Up to 10s connectivity disruption should not drop critical events.
- Critical alerts must retry automatically and preserve original timestamp.

Rule for AI-SDR:
- Hardening must include offline queue and retry validation for critical flows.

## Definition of Success
- Emergency workflow completes within strict SLA
- Core tasks are assist-free for majority users
- Compliance evidence exists for sensitive events

Rule for AI-SDR:
- Treat emergency SLA breach as release blocker.
