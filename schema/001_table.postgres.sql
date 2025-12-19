-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  idempotency_keys

CREATE TABLE IF NOT EXISTS idempotency_keys (
  key_hash CHAR(64) NOT NULL PRIMARY KEY,
  key_hash_key_version VARCHAR(64) NULL,
  tenant_id BIGINT NOT NULL,
  payment_id BIGINT NULL DEFAULT NULL,
  order_id BIGINT NULL DEFAULT NULL,
  gateway_payload JSONB NULL,
  redirect_url VARCHAR(1024) NULL,
  created_at TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  ttl_seconds INTEGER NOT NULL DEFAULT 86400
);
