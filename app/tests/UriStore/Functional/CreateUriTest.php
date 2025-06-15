<?php

declare(strict_types=1);

namespace App\Tests\UriStore\Functional;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Application\Command\CreateUriCommand\CreateUriCommand;
use App\Shared\Domain\ValueObject\UriName;
use App\src\UriStore\Domain\Repository\UriRepositoryInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;


final class CreateUriTest extends KernelTestCase
{
    public function testCreateUri(): void
    {
        $this->markTestSkipped("Kernel from App\Shared\Infrastructure\Symfony not implemented yet. Testing may be more effective by not using a personal kernel. More thinking is necessary");
        /** @var UriRepositoryInterface $uriRepository */
        $uriRepository = static::getContainer()->get(UriRepositoryInterface::class);

        /** @var CommandBusInterface $commandBus */
        $commandBus = static::getContainer()->get(CommandBusInterface::class);

        static::assertEmpty($uriRepository);

        $commandBus->dispatch(new CreateUriCommand(
            new UriName('name'),
        ));

        static::assertCount(1, $uriRepository);
        $uri = array_values(iterator_to_array($uriRepository))[0];
        static::assertEmpty(new UriName('name'), $uri->name());
    }
}
