<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\IdempotencyKeys;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'idempotency_keys'; }
    public static function contractView(): string { return 'v_idempotency_keys_contract'; }
    /** @return string[] */
    public static function columns(): array { return [ 'key_hash', 'payment_id', 'order_id', 'gateway_payload', 'redirect_url', 'created_at', 'ttl_seconds' ]; }
    public static function pk(): string { return 'key_hash'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'created_at DESC, id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return [ 'gateway_payload' ]; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
