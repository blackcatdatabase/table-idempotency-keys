-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  idempotency_keys
CREATE INDEX idx_idemp_payment ON idempotency_keys (payment_id);

CREATE INDEX idx_idemp_order ON idempotency_keys (order_id);

CREATE INDEX idx_idemp_created_at ON idempotency_keys (created_at);
