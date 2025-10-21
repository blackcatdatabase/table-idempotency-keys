-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: idempotency_keys
ALTER TABLE idempotency_keys ADD CONSTRAINT fk_idemp_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE SET NULL;
