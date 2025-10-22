-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: idempotency_keys
CREATE TABLE IF NOT EXISTS idempotency_keys (
  key_hash CHAR(64) NOT NULL PRIMARY KEY,
  payment_id BIGINT UNSIGNED NULL DEFAULT NULL,
  order_id BIGINT UNSIGNED NULL DEFAULT NULL,
  gateway_payload JSON NULL,
  redirect_url VARCHAR(1024) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  ttl_seconds INT NOT NULL DEFAULT 86400,
  INDEX idx_idemp_payment (payment_id),
  INDEX idx_idemp_order (order_id),
  INDEX idx_idemp_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
