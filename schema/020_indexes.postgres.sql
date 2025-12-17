-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  idempotency_keys

CREATE INDEX IF NOT EXISTS idx_idemp_payment ON idempotency_keys (payment_id);

CREATE INDEX IF NOT EXISTS idx_idemp_order ON idempotency_keys (order_id);

CREATE INDEX IF NOT EXISTS idx_idemp_created_at ON idempotency_keys (created_at);

CREATE INDEX IF NOT EXISTS idx_idemp_tenant_payment ON idempotency_keys (tenant_id, payment_id);

CREATE INDEX IF NOT EXISTS idx_idemp_tenant_order   ON idempotency_keys (tenant_id, order_id);
