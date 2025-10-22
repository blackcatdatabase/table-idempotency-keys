<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\IdempotencyKeys\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class IdempotencyKeyDto {
    public function __construct(
        public readonly string $keyHash,
        public readonly ?int $paymentId,
        public readonly ?int $orderId,
        public readonly array|null $gatewayPayload,
        public readonly ?string $redirectUrl,
        public readonly \DateTimeImmutable $createdAt,
        public readonly int $ttlSeconds
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
