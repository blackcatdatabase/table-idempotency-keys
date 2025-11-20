<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – idempotency_keys

Idempotency keys to deduplicate external payment/API requests.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| key_hash | CHAR(64) | NO | — | Key hash (natural PK). | PII: token |
| tenant_id | BIGINT | NO | — |  |  |
| payment_id | BIGINT | YES | NULL | Related payment (FK payments.id), optional. |  |
| order_id | BIGINT | YES | NULL | Related order (FK orders.id), optional. |  |
| gateway_payload | JSONB | YES | — | Original payload JSON. |  |
| redirect_url | VARCHAR(1024) | YES | — | Client redirect URL (if any). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| ttl_seconds | INTEGER | NO | 86400 | Time-to-live in seconds (> 0). |  |