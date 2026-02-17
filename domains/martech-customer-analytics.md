# Domain Expectations - MarTech & Customer Analytics

## Document Version
- Version: `v1.0.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Data quality and consent compliance override dashboard/feature speed.

## Domain Context
- Campaign attribution, segmentation, funnel and retention analytics
- Goal: trustworthy insights with compliant data handling

## Regülasyon Katmanı
- Consent and privacy compliance (GDPR/KVKK equivalents) required for customer-level analytics.
- Personally identifiable fields must be minimized, masked, or pseudonymized.

Rule for AI-SDR:
- PM/Architect outputs must include consent-source traceability.

## Persona Katmanı
- Marketer persona: fast insight and campaign actionability.
- Analyst persona: consistent metric definitions and reproducibility.

Rule for AI-SDR:
- Glossary and taxonomy must lock metric definitions across modules.

## Hata Tolerans Katmanı
- If event ingestion stalls up to 10s, pipeline must buffer and preserve ordering metadata.
- Partial ingestion failures must surface data-freshness warnings.

Rule for AI-SDR:
- Hardening gates must include ingestion lag and data-freshness alerts.

## Definition of Success
- Metric consistency across dashboards
- Consent-compliant segmentation
- Low data freshness lag for operational decisions

Rule for AI-SDR:
- Release blocks when consent lineage or metric consistency is unverifiable.
