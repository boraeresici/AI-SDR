# Domain Expectations - SMB Booking

## Document Version
- Version: `v2.1.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Apply domain constraints as higher priority than generic defaults.

## Domain Context
- Target users: small business owners and service-booking customers
- Primary goal: maximize booking conversion with low operational overhead

## Regülasyon Katmanı
- Customer PII handling must comply with regional privacy rules (KVKK/GDPR equivalents).
- Payment-related data must never be stored outside approved boundaries.

Rule for AI-SDR:
- Security and DevOps outputs must include retention and masking controls.

## Persona Katmanı
- Owner persona: fast calendar/inventory control, low operational burden.
- Customer persona: quick booking with minimal form friction.

Rule for AI-SDR:
- PM and UX outputs must optimize conversion-critical steps and reduce input burden.

## Hata Tolerans Katmanı
- If booking confirmation cannot be returned within 10 seconds, user must get explicit retry/recovery state.
- Slot-lock failures must degrade gracefully without silent data loss.

Rule for AI-SDR:
- QA and E2E must include retry and race-condition scenarios.

## Definition of Success
- Business Logic Constraints:
  - A single time slot cannot be double-booked under any condition.
- Critical Failures:
  - Booking confirmation delay above 3 seconds on primary path is failure.
- KPI Baselines:
  - Booking completion uplift
  - Checkout drop-off reduction

Rule for AI-SDR:
- Treat slot-collision and confirmation latency as hard release criteria.

## Glossary & Taxonomy
- `Owner`: business operator managing inventory/slots.
- `Customer`: end user creating bookings.
- `Notify`: transactional confirmation via email, optional SMS fallback.

Rule for AI-SDR:
- Keep owner/customer permissions and notification channels explicit in contracts.

## No-Go List
- Never accept booking without atomic slot lock/validation.
- Never expose customer contact data in logs.
- Never require non-essential fields in first booking step.

Rule for AI-SDR:
- Block merge/release when slot consistency or data-protection No-Go is violated.

## Domain Constraints & Edge Cases
- Concurrency: simultaneous booking attempts resolve deterministically (first commit wins).
- Connectivity: temporary failure must surface retriable state, not silent success.

Rule for AI-SDR:
- Contract and E2E gates must include collision and retry-path checks.

## Integration Rules
- External APIs: payment/messaging providers must be from approved list.
- Reconciliation rules: booking and payment status consistency must be auditable.

Rule for AI-SDR:
- DevOps and ROI outputs must include reconciliation risk checks.

## Quality Gate Priorities
- Booking critical path coverage: 100%
- Contract compatibility for booking/payment endpoints: 0 breaking changes
- Security gate: no unresolved high/critical findings

Rule for AI-SDR:
- Release decision is blocked if booking critical path or compatibility gate fails.
