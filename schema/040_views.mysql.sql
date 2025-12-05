-- Auto-generated from schema-views-mysql.yaml (map@sha1:A4E10261DACB7519F6FEA44ED77A92163429CA5E)
-- engine: mysql
-- table:  idempotency_keys

-- Contract view for [idempotency_keys]
-- Hides gateway_payload body; adds expiry helpers.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_idempotency_keys AS
SELECT
  key_hash,
  tenant_id,
  payment_id,
  order_id,
  gateway_payload,
  redirect_url,
  created_at,
  ttl_seconds,
  (created_at + INTERVAL ttl_seconds SECOND) AS expires_at,
  (ttl_seconds IS NOT NULL AND created_at IS NOT NULL AND created_at + INTERVAL ttl_seconds SECOND <= NOW()) AS is_expired,
  UPPER(key_hash) AS key_hash_hex
FROM idempotency_keys;
