-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: idempotency_keys
ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE SET NULL;
