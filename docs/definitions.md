# idempotency_keys

Idempotency keys to deduplicate external payment/API requests.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| gateway_payload | mysql: JSON / postgres: JSONB | YES |  | Original payload JSON. |
| key_hash | CHAR(64) | NO |  | Key hash (natural PK). |
| order_id | BIGINT | YES | NULL | Related order (FK orders.id), optional. |
| payment_id | BIGINT | YES | NULL | Related payment (FK payments.id), optional. |
| redirect_url | VARCHAR(1024) | YES |  | Client redirect URL (if any). |
| ttl_seconds | mysql: INT / postgres: INTEGER | NO | 86400 | Time-to-live in seconds (> 0). |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_idemp_created_at | created_at | INDEX idx_idemp_created_at (created_at) |
| idx_idemp_order | order_id | INDEX idx_idemp_order (order_id) |
| idx_idemp_payment | payment_id | INDEX idx_idemp_payment (payment_id) |
| idx_idemp_tenant_order | tenant_id,order_id | INDEX idx_idemp_tenant_order (tenant_id, order_id) |
| idx_idemp_tenant_payment | tenant_id,payment_id | INDEX idx_idemp_tenant_payment (tenant_id, payment_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_idemp_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE CASCADE |
| fk_idemp_payment | tenant_id,payment_id | payments(tenant_id,id) | ON DELETE CASCADE |
| fk_idemp_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_idemp_created_at | created_at | CREATE INDEX IF NOT EXISTS idx_idemp_created_at ON idempotency_keys (created_at) |
| idx_idemp_order | order_id | CREATE INDEX IF NOT EXISTS idx_idemp_order ON idempotency_keys (order_id) |
| idx_idemp_payment | payment_id | CREATE INDEX IF NOT EXISTS idx_idemp_payment ON idempotency_keys (payment_id) |
| idx_idemp_tenant_order | tenant_id,order_id | CREATE INDEX IF NOT EXISTS idx_idemp_tenant_order   ON idempotency_keys (tenant_id, order_id) |
| idx_idemp_tenant_payment | tenant_id,payment_id | CREATE INDEX IF NOT EXISTS idx_idemp_tenant_payment ON idempotency_keys (tenant_id, payment_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_idemp_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE CASCADE |
| fk_idemp_payment | tenant_id,payment_id | payments(tenant_id,id) | ON DELETE CASCADE |
| fk_idemp_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_idempotency_keys | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_idempotency_keys | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
