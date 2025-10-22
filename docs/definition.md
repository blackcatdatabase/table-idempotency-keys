<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – idempotency_keys

Idempotency keys to deduplicate external payment/API requests.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| key_hash | CHAR(64) | NO | — | Key hash (natural PK). | PII: token |
| payment_id | BIGINT UNSIGNED | YES | NULL | Related payment (FK payments.id), optional. |  |
| order_id | BIGINT UNSIGNED | YES | NULL | Related order (FK orders.id), optional. |  |
| gateway_payload | JSON | YES | — | Original payload JSON. |  |
| redirect_url | VARCHAR(1024) | YES | — | Client redirect URL (if any). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| ttl_seconds | INT | NO | 86400 | Time-to-live in seconds. |  |