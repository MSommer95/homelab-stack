#!/bin/bash
set -eo pipefail
WD=$(dirname "${BASH_SOURCE[0]}")

export COMPOSE_PROJECT_NAME=raspi-stack

if [ "$1" = "start" ]; then
    docker-compose -f ${WD}/docker-compose.yml build 
    mkdir -p ${WD}/data/config
    docker-compose -f ${WD}/docker-compose.yml up -d --remove-orphans
fi
if [ "$1" = "stop" ]; then
    docker-compose -f ${WD}/docker-compose.yml stop
fi
if [ "$1" = "update" ]; then
    docker-compose -f ${WD}/docker-compose.yml pull
    docker-compose up -d
    docker image prune
fi
if [ "$1" = "remove" ]; then
    docker-compose -f ${WD}/docker-compose.yml down -v
fi
if [ "$1" = "logs" ]; then
    docker-compose logs -f
fi
