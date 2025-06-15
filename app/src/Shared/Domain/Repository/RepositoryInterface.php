<?php

declare(strict_types=1);

namespace App\Shared\Domain\Repository;

use Iterator;

interface RepositoryInterface extends \IteratorAggregate, \Countable
{
    public function getIterator(): Iterator;

    public function count(): int;
}
