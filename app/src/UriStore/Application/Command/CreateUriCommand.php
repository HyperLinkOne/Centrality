<?php

declare(strict_types=1);

namespace App\Shared\Application\Command\CreateUriCommand;


use App\Shared\Application\Command\CommandInterface;
use App\Shared\Domain\ValueObject\UriName;

class CreateUriCommand implements CommandInterface
{
    public function __construct(
        public UriName $uriName,
    ) {
    }
}
