# Installation related information
## System setup hints
* 🧠 .dockerignore is used because the php-Service uses context: . which forces docker to check/read ALL directories in the
the project. Since postgress_data is absolutely irrelevant to the php build process, we tell docker to ignore this directory.


## phpStorm setting up debugging and Testing
### debugging code
* /file/settings/PHP 
  * CLI Interpreter use `...` 
  * use `From docker, vagant ...`
  * via configuration files use compose.yaml and select your service, php in this case 
* create a DefaultController like 
```php
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
```

* Test 

### debugging tests
* /file/settings/PHP/Test Frameworks
 + to add a cli Interpreter
   * Path to script: /app/vendor/autoload.php 
 
## used Bundles
* initial setup `composer create-project symfony/skeleton .`
* debug `composer req --dev debug` -> gives the webbar
* testing 
   * `composer req --dev symfony/test-pack` and
   * then run `php bin/phpunit`
* database `composer req doctrine`
* logging `composer req symfony/monolog-bundl`
* `composer req beberlei/assert`
* `composer req symfony/uid`