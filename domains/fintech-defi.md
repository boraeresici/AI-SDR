# Domain Expectations - FinTech & DeFi

## Document Version
- Version: `v1.0.0`
- Last Updated: `2026-02-17`
- Status: `Active`

## Requirement Conflict Policy
In case of conflict between generic architectural patterns and this document, this document ALWAYS wins.

Rule for AI-SDR:
- Financial integrity and auditability override speed-first defaults.

## Domain Context
- Financial transactions, wallets, balances, and settlement flows
- Goal: secure, deterministic, and auditable transaction processing

## Regulation Layer
- Payment handling must align with PCI-DSS-style constraints.
- Financial records must maintain immutable audit trails and retention policies.

Rule for AI-SDR:
- Architect and Security outputs must include tamper-evident logging and key management controls.

## Persona Layer
- End user persona: low-latency transfer expectations, high trust sensitivity.
- Operator/compliance persona: strict audit, reconciliation, and anomaly visibility.

Rule for AI-SDR:
- PM must include reconciliation and dispute handling in critical scope.

## Failure Tolerance Layer
- If confirmation is delayed beyond 10s, user gets explicit pending state with transaction hash/reference.
- Duplicate submission must be idempotent and not double-charge.

Rule for AI-SDR:
- QA/E2E must include idempotency, retry, and rollback simulation tests.

## Definition of Success
- No double-spend/double-charge behavior
- Reconciliation mismatch rate near zero
- Security gate has zero unresolved high/critical findings

Rule for AI-SDR:
- Release blocks on unresolved reconciliation or idempotency defects.
