<?php

declare(strict_types=1);

use App\UriStore\Domain\Repository\UriRepositoryInterface;
use App\UriStore\Infrastructure\Doctrine\DoctrineUriRepository;
use App\UriStore\Infrastructure\InMemory\InMemoryUriRepository;
use Symfony\Component\DependencyInjection\Loader\Configurator\ContainerConfigurator;

return static function (ContainerConfigurator $containerConfigurator): void {
    $services = $containerConfigurator->services();

    $services->defaults()
        ->autowire()
        ->autoconfigure();

    // repositories
    $services->set(UriRepositoryInterface::class)
        ->class(InMemoryUriRepository::class);

    $services->set(InMemoryUriRepository::class)
        ->public();

    $services->set(DoctrineUriRepository::class)
        ->public();
};
