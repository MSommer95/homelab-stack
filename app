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

if [ "$#" -ne 1 ] || [[ "$1" != "start" && "$1" != "stop" && "$1" != "remove" && "$1" != "logs" ]]; then
    echo '''
  usage: app [start|stop|remove]

    start:  Build and start containers.
    stop:   Stop the containers.
    update: Update the containers by pulling new images. 
    remove: Delete containers and the data dir.
    logs:   Show logs of containers.
    '''
    exit 1
fi

source_file .env 

if [ "$1" = "start" ]; then
    docker-compose -f ${WD}/docker-compose.yml build 
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
    rm -r ./data
fi
if [ "$1" = "logs" ]; then
    docker-compose logs -f
fi
