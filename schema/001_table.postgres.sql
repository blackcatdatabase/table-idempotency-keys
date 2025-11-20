-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  idempotency_keys
CREATE TABLE IF NOT EXISTS idempotency_keys (
  key_hash CHAR(64) NOT NULL PRIMARY KEY,
  tenant_id BIGINT NOT NULL,
  payment_id BIGINT NULL DEFAULT NULL,
  order_id BIGINT NULL DEFAULT NULL,
  gateway_payload JSONB NULL,
  redirect_url VARCHAR(1024) NULL,
  created_at TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  ttl_seconds INTEGER NOT NULL DEFAULT 86400
);
