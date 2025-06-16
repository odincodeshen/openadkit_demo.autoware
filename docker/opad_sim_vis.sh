#!/bin/bash
# Configure the environment variables

#export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#export SCRIPT_DIR="$( pwd )"
#export
#CONF_FILE_PASS=$SCRIPT_DIR/etc/simulation/config/pass_static_obstacle_avoid ance.param.yaml

SCRIPT_DIR=/home/ubuntu/openadkit_demo.autoware/docker
export
CONF_FILE_FAIL=$SCRIPT_DIR/etc/simulation/config/fail_static_obstacle_avoidance.param.yaml
export CONF_FILE=$CONF_FILE_FAIL
export COMMON_FILE=$SCRIPT_DIR/etc/simulation/config/common.param.yaml
export NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN
export NGROK_URL=$NGROK_URL
# Start visualizer and show logs
docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up visualizer -d
echo "Waiting 10 seconds for visualizer to start..."
sleep 10
docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" logs visualizer
# Start simulator
echo "Running simulator v1.."
TIMEOUT=300 CONF_FILE=$CONF_FILE_FAIL docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up simulator --abort-on-container-exit
TIMEOUT=300 CONF_FILE=$CONF_FILE_FAIL docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up simulator --abort-on-container-exit
TIMEOUT=300 CONF_FILE=$CONF_FILE_FAIL docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up simulator --abort-on-container-exit