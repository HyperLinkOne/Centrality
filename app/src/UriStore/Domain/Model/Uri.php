<?php

declare(strict_types=1);

namespace App\Shared\Domain\Model;

use App\Shared\Domain\ValueObject\UriName;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Uri
{
    #[ORM\Embedded(columnPrefix: false)]
    private readonly UriId $id;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private UriName $name,
    ) {
        $this->id = new UriId();
    }

    public function update(
        ?UriName $name = null,
    ): void
    {
        $this->name = $name ?? $this->name;
    }
}
