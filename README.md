# 📦 Idempotency Keys

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **idempotency_keys** (repo: `idempotency-keys`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| key_hash | CHAR(64) | NO | — | PK |
| tenant_id | BIGINT | NO | — |  |
| payment_id | BIGINT | YES | NULL |  |
| order_id | BIGINT | YES | NULL |  |
| gateway_payload | JSONB | YES | — |  |
| redirect_url | VARCHAR(1024) | YES | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |
| ttl_seconds | INTEGER | NO | 86400 |  |

## Relationships
- FK → **orders** via (tenant_id,order_id) (ON DELETE SET NULL).
- FK → **payments** via (tenant_id,payment_id) (ON DELETE SET NULL).
- FK → **tenants** via (tenant_id) (ON DELETE RESTRICT).

```mermaid
erDiagram
  IDEMPOTENCY_KEYS {
    VARCHAR key_hash PK
    INT tenant_id
    INT payment_id
    INT order_id
    JSONB gateway_payload
    VARCHAR redirect_url
    TIMESTAMPTZ created_at
    INTEGER ttl_seconds
  }
  IDEMPOTENCY_KEYS }o--|| ORDERS : "tenant_id, order_id"
  IDEMPOTENCY_KEYS }o--|| PAYMENTS : "tenant_id, payment_id"
  IDEMPOTENCY_KEYS }o--|| TENANTS : "tenant_id"
```

## Indexes
- 5 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
