-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  idempotency_keys

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_payment FOREIGN KEY (tenant_id, payment_id) REFERENCES payments(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_order   FOREIGN KEY (tenant_id, order_id)   REFERENCES orders(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE idempotency_keys ADD CONSTRAINT chk_idemp_ttl CHECK (ttl_seconds > 0);
