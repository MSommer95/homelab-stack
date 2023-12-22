#!/bin/bash
set -eo pipefail
WD=$(dirname "${BASH_SOURCE[0]}")

error() {
   echo -e "ERROR: $1" 1>&2
   exit 1
}
info() {
    echo -e "INFO: $1"
}

source_file() {
    if [ ! -f $1 ]; then
        error "missing configurationfile '$1'"
    fi
    eval $(cat $1 | grep -Ev '(#.*$)|(^\s*$)' | sed 's/^/export /')
}

if [ "$#" -ne 1 ] || [[ "$1" != "start" && "$1" != "stop" && "$1" != "remove" && "$1" != "logs" && "$1" != "update" && "$1" != "create" ]]; then
    echo '''
  usage: app [start|stop|remove]

    start:  Build and start containers.
    stop:   Stop the containers.
    update: Update the containers by pulling new images.
    remove: Delete containers.
    logs:   Show logs of containers.
    '''
    exit 1
fi

source_file .env 

COMPOSE_FILES=( -f ${WD}/docker-compose.main.yml -f ${WD}/docker-compose.monitoring.yml -f ${WD}/docker-compose.media.yml -f ${WD}/docker-compose.immich.yml -f ${WD}/docker-compose.test.yml )


if [ "$1" = "start" ]; then
    docker compose "${COMPOSE_FILES[@]}" build
    docker compose "${COMPOSE_FILES[@]}" up -d --remove-orphans
fi
if [ "$1" = "stop" ]; then
    docker compose "${COMPOSE_FILES[@]}" stop
fi
if [ "$1" = "update" ]; then
    docker compose "${COMPOSE_FILES[@]}" pull
    docker compose "${COMPOSE_FILES[@]}" build
    docker compose "${COMPOSE_FILES[@]}" up -d --remove-orphans
    docker image prune
fi
if [ "$1" = "remove" ]; then
    docker compose "${COMPOSE_FILES[@]}" down -v
fi
if [ "$1" = "logs" ]; then
    docker compose "${COMPOSE_FILES[@]}" logs -f
fi
