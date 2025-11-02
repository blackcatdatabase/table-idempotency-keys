-- Auto-generated from schema-map-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  idempotency_keys
ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE SET NULL;

ALTER TABLE idempotency_keys ADD CONSTRAINT chk_idemp_ttl CHECK (ttl_seconds > 0);
