-- Auto-generated from schema-map-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  idempotency_keys
CREATE INDEX IF NOT EXISTS idx_idemp_payment ON idempotency_keys (payment_id);

CREATE INDEX IF NOT EXISTS idx_idemp_order ON idempotency_keys (order_id);

CREATE INDEX IF NOT EXISTS idx_idemp_created_at ON idempotency_keys (created_at);
