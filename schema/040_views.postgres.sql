-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  idempotency_keys
-- Contract view for [idempotency_keys]
-- Hides gateway_payload body by default.
CREATE OR REPLACE VIEW vw_idempotency_keys AS
SELECT
  key_hash,
  payment_id,
  order_id,
  redirect_url,
  created_at,
  ttl_seconds
FROM idempotency_keys;
