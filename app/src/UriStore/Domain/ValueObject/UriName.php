<?php

declare(strict_types=1);

namespace App\Shared\Domain\ValueObject;

use Doctrine\ORM\Mapping as ORM;
use Assert\Assert;

#[ORM\Embeddable]
final readonly class UriName
{
    #[ORM\Column(name: 'name', length: 255)]
    public readonly string $value;
    // Construction
    public function __construct(
        string $value,
    ) {
        Assert::that($value)->notBlank()->maxLength(255);
        $this->value = $value;
    }
}
