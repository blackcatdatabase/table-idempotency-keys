-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  idempotency_keys
-- Contract view for [idempotency_keys]
-- Hides gateway_payload body; adds expiry helpers.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_idempotency_keys AS
SELECT
  key_hash,
  payment_id,
  order_id,
  redirect_url,
  created_at,
  ttl_seconds,
  TIMESTAMPADD(SECOND, ttl_seconds, created_at) AS expires_at,
  (TIMESTAMPADD(SECOND, ttl_seconds, created_at) < NOW()) AS is_expired
FROM idempotency_keys;
