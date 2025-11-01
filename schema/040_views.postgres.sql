-- Auto-generated from schema-views-postgres.psd1 (map@c5e4097)
-- engine: postgres
-- table:  idempotency_keys
-- Contract view for [idempotency_keys]
-- Hides gateway_payload body; adds expiry helpers.
CREATE OR REPLACE VIEW vw_idempotency_keys AS
SELECT
  key_hash,
  encode(key_hash, 'hex') AS key_hash_hex,
  payment_id,
  order_id,
  redirect_url,
  created_at,
  ttl_seconds,
  (created_at + make_interval(secs => ttl_seconds)) AS expires_at,
  CASE WHEN (ttl_seconds IS NOT NULL AND created_at IS NOT NULL AND (created_at + make_interval(secs => ttl_seconds)) <= now()) THEN 1 ELSE 0 END AS is_expired
FROM idempotency_keys;
