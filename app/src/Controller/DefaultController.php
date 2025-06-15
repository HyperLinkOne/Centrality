<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DefaultController
{
    #[Route('/default', methods: ['GET'])]
    public function index(Request $request): Response
    {
        $response = new Response();
        $response->setContent('Hello world!');
        $response->setStatusCode(200);

        return $response;
    }
}
