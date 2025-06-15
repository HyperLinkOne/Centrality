<?php

declare(strict_types=1);

namespace App\UriStore\Domain\ValueObject;

use App\Shared\Domain\ValueObject\AggregateRootId;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class UriId implements \stringable
{
    use AggregateRootId;
}
