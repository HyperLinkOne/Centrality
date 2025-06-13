#!/bin/bash

SHELL:=/bin/bash
PROJECT=php

.DEFAULT_GOAL:=help

.PHONY: build up down exec start stop restart

DOCKER_COMPOSE_COMMAND := @docker-compose -f ${PWD}/compose.yaml 

# check if enfironment is dev or prod to use different env-file for creation just like
# $(ENVIRONMENT) == 'dev'
#
# DOCKER_COMPOSE_COMMAND := @docker compose --env-file app/.env.local -f ${PWD}/compose.yaml
# until then  use password etc from compose.yaml

UNAME_S := $(shell uname -s)

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

#####################
###  Development  ###
#####################

#ifeq ($(UNAME_S),Linux)
#	$(shell sed -i 's/    platform: linux\/arm64\/v8//g' ${PWD}/compose.yaml)
#endif

build: ## Build the development environment
    ${DOCKER_COMPOSE_COMMAND}

# ${DOCKER_COMPOSE_COMMAND} build
#	${DOCKER_COMPOSE_COMMAND} exec ${PROJECT} composer install

up: ## just up
	${DOCKER_COMPOSE_COMMAND} up -d

down: ## just down
	${DOCKER_COMPOSE_COMMAND} down

exec: ## Exec into the container
	${DOCKER_COMPOSE_COMMAND} exec  ${PROJECT} bash

stop: ## Stop the container
	${DOCKER_COMPOSE_COMMAND} stop  ${PROJECT}

start: ## Start the container
	${DOCKER_COMPOSE_COMMAND} start  ${PROJECT}

restart: ## Restart the container
	${DOCKER_COMPOSE_COMMAND} restart  ${PROJECT}
