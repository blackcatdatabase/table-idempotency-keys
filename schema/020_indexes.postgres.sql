-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  idempotency_keys
CREATE INDEX IF NOT EXISTS idx_idemp_payment ON idempotency_keys (payment_id);

CREATE INDEX IF NOT EXISTS idx_idemp_order ON idempotency_keys (order_id);

CREATE INDEX IF NOT EXISTS idx_idemp_created_at ON idempotency_keys (created_at);

CREATE INDEX IF NOT EXISTS idx_idemp_tenant_payment ON idempotency_keys (tenant_id, payment_id);

CREATE INDEX IF NOT EXISTS idx_idemp_tenant_order   ON idempotency_keys (tenant_id, order_id);
