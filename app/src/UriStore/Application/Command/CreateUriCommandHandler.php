<?php

declare(strict_types=1);

namespace App\Shared\Application\Command\CreateUriCommand;

use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Model\Uri;
use UriRepositoryInterface;

#[AsCommandHandler]
final readonly class CreateUriCommandHandler
{
    public function __construct(private UriRepositoryInterface $uriRepository)
    {
    }

    public function __invoke(CreateUriCommand $command): Uri
    {
        $uri = new Uri(
            $command->uriName,
        );
        $this->uriRepository->add($uri);

        return $uri;
    }
}
