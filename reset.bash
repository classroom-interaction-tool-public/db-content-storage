#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

CONFIG_COMPOSE_FILE="$SCRIPT_DIR/config/docker-compose.yml"
SHARD_1_COMPOSE_FILE="$SCRIPT_DIR/shard-1/docker-compose.yml"
SHARD_2_COMPOSE_FILE="$SCRIPT_DIR/shard-2/docker-compose.yml"
SHARD_3_COMPOSE_FILE="$SCRIPT_DIR/shard-3/docker-compose.yml"
MONGOS_COMPOSE_FILE="$SCRIPT_DIR/mongos/docker-compose.yml"

shutdown_service() {
    echo "Shutting down $1..."
    docker-compose -f $1 down -v
}

if [[ -f "$CONFIG_COMPOSE_FILE" && -f "$SHARD_1_COMPOSE_FILE" && -f "$SHARD_2_COMPOSE_FILE" && -f "$SHARD_3_COMPOSE_FILE" && -f "$MONGOS_COMPOSE_FILE" ]]; then
    shutdown_service "$CONFIG_COMPOSE_FILE"
    shutdown_service "$SHARD_1_COMPOSE_FILE"
    shutdown_service "$SHARD_2_COMPOSE_FILE"
    shutdown_service "$SHARD_3_COMPOSE_FILE"
    shutdown_service "$MONGOS_COMPOSE_FILE"
else
    echo "One or more Docker Compose files not found."
fi
