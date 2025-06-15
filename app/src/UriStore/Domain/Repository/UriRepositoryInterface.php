<?php

declare(strict_types=1);

namespace   App\src\UriStore\Domain\Repository;

use App\Shared\Domain\Model\Uri;
use App\Shared\Domain\Repository\RepositoryInterface;
use App\UriStore\Domain\ValueObject\UriId;

interface UriRepositoryInterface extends RepositoryInterface
{
    public function add(Uri $uri): void;

    public function remove(Uri $uri): void;

    public function ofId(UriId $id): ?Uri;

}
