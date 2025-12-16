-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  idempotency_keys

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_payment FOREIGN KEY (tenant_id, payment_id) REFERENCES payments(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_order   FOREIGN KEY (tenant_id, order_id)   REFERENCES orders(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE idempotency_keys ADD CONSTRAINT chk_idemp_ttl CHECK (ttl_seconds > 0);
