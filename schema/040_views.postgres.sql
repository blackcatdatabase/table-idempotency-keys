-- Auto-generated from schema-views-postgres.yaml (map@sha1:A35B3CB52780A1043442511D947A51BA2C27622C)
-- engine: postgres
-- table:  idempotency_keys

-- Contract view for [idempotency_keys]
-- Hides gateway_payload body; adds expiry helpers.
CREATE OR REPLACE VIEW vw_idempotency_keys AS
SELECT
  key_hash,
  UPPER(btrim(key_hash)) AS key_hash_hex,
  tenant_id,
  payment_id,
  order_id,
  gateway_payload,
  redirect_url,
  created_at,
  ttl_seconds,
  (created_at + make_interval(secs => ttl_seconds)) AS expires_at,
  (ttl_seconds IS NOT NULL AND created_at IS NOT NULL AND (created_at + make_interval(secs => ttl_seconds)) <= now()) AS is_expired
FROM idempotency_keys;
