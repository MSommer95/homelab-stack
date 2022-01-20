#!/bin/bash
set -eo pipefail
WD=$(dirname "${BASH_SOURCE[0]}")

if [ "$1" = "start" ]; then
    docker-compose -f ${WD}/docker-compose.yml build
    mkdir -p ${WD}/config
    docker-compose -f ${WD}/docker-compose.yml up -d
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
