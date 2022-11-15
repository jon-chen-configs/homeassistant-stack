#!/bin/sh

WD="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTS_DIR=${WD}/../../../scripts
export ENV_DIR=${WD}/../../../../compose/conf/swarm-env-config
export ENV_FILE=${ENV_DIR}/swarm.env
export COMPOSE_FILE=${WD}/homeassistant-swarm.yml
export STACK_NAME=homeassistant-swarm

${SCRIPTS_DIR}/stack.deploy.sh
