<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\IdempotencyKeys\Joins;

use BlackCat\Database\Support\SqlIdentifier as Ident;
use BlackCat\Core\Database as Database;

/**
 * Methods generated from foreign keys.
 *
 * Return structure: [string $sqlJoinFragment, array $params]
 * Join policy:
 *   - -JoinPolicy left  => always LEFT JOIN (default)
 *   - -JoinPolicy all   => INNER JOIN if ALL local FK columns are NOT NULL
 *   - -JoinPolicy any   => INNER JOIN if AT LEAST ONE local FK column is NOT NULL
 */
final class IdempotencyKeysJoins {

    /** @internal */
    private function qi(?Database $db, string $ident): string {
        return $db ? Ident::qi($db, $ident) : $ident;
    }

    /** @internal */
    private function q(?Database $db, string $ident): string {
        return $db ? Ident::q($db, $ident) : $ident;
    }

    /** @internal Short SQL alias validation (guards against invalid input). */
    private function assertAlias(string $s): string {
        if (!preg_match('/^[A-Za-z_][A-Za-z0-9_]*$/', $s)) {
            throw new \InvalidArgumentException("Invalid SQL alias: {$s}");
        }
        return $s;
    }

    /** @internal Validate both aliases and ensure they differ. */
    private function assertAliasPair(string $alias, string $as): array {
        $alias = $this->assertAlias($alias);
        $as    = $this->assertAlias($as);
        if ($alias === $as) {
            throw new \InvalidArgumentException("Join alias must differ from base alias: {$alias}");
        }
        return [$alias, $as];
    }


    /**
     * FK: idempotency_keys -> tenants
     * LEFT JOIN vw_tenants AS $as ON $as.id = $alias.tenant_id
     * @return array{0:string,1:array<string,mixed>}
     */
    public function joinTenants(string $alias = 't', string $as = 'j0'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_tenants AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.tenant_id' . ' ', []];
    }
    /**
     * FK: idempotency_keys -> payments
     * LEFT JOIN vw_payments AS $as ON $as.tenant_id = $alias.tenant_id AND $as.id = $alias.payment_id
     * @return array{0:string,1:array<string,mixed>}
     */
    public function joinPayments(string $alias = 't', string $as = 'j1'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_payments AS ' . $as . ' ON ' . $as . '.tenant_id = ' . $alias . '.tenant_id' . ' AND ' . $as . '.id = ' . $alias . '.payment_id' . ' ', []];
    }
    /**
     * FK: idempotency_keys -> orders
     * LEFT JOIN vw_orders AS $as ON $as.tenant_id = $alias.tenant_id AND $as.id = $alias.order_id
     * @return array{0:string,1:array<string,mixed>}
     */
    public function joinOrders(string $alias = 't', string $as = 'j2'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_orders AS ' . $as . ' ON ' . $as . '.tenant_id = ' . $alias . '.tenant_id' . ' AND ' . $as . '.id = ' . $alias . '.order_id' . ' ', []];
    }

}
