# Symfony Project
## Informations
* purpose of Centrality are explained here: [readme](infos/Readme.md)   
* Architecture here: [architecture](infos/Architecture.md)   

## Structure

```
/path/to/your-project/
|📂 app
|   |-- .env
|   `-- .env.local
|
|📂 docker/
|   |   dev/
|       |📂 nginx/
|       |   `-- nginx.conf
|       |📂 php/
|           |-- php.ini
|           |-- xdebug.ini
|           |-- entrypoint.sh
|           `-- Dockerfile
|
|📂 docs/
|
|📂 data/
|   |📂 postgres_data/
|       |--  ....
|       `--  ....
|
|-- docker-compose.yml
|-- Makefile
|-- README.md

```

## Logs and Errors 
* ~/docker/docker compose logs php


## Symfony setup
### use this commands in the container 

```
   composer create-project symfony/skeleton .

   chown -R 1000 .
```

### used Bundles
* `composer req --dev debug`
* composer require symfony/maker-bundle --dev  # nicht unbedingt nötig
* composer require twig   # nur wenn man auch Webausgaben mit Templates will 
* Webprofile (debug)
* Monolog
* EasyAdmin
* Security
* EkoFeed  => um RSS-Feeds zu erzeugen..   später
* ...
