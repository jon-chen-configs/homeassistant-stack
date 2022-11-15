#!/bin/sh

WD="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export ENV_DIR=${WD}/../../../../compose/conf/swarm-env-config
export ENV_FILE=${ENV_DIR}/swarm.env
export COMPOSE_FILE=${WD}/zwavejs2mqtt-compose.yml

docker-compose --env-file ${ENV_FILE} --file ${COMPOSE_FILE} down
