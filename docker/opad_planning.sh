!/bin/bash
# Configure the environment variables
export SCRIPT_DIR=/home/ubuntu/openadkit_demo.autoware/docker

CONF_FILE_PASS=$SCRIPT_DIR/etc/simulation/config/pass_static_obstacle_avoidance.param.yaml
CONF_FILE_FAIL=$SCRIPT_DIR/etc/simulation/config/fail_static_obstacle_avoidance.param.yaml

export CONF_FILE=$CONF_FILE_FAIL
export COMMON_FILE=$SCRIPT_DIR/etc/simulation/config/common.param.yaml
export NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN
export NGROK_URL=$NGROK_URL

# Start planning-control
        echo "Running planning v1.."
        TIMEOUT=120 CONF_FILE=$CONF_FILE_PASS docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up planning-control --abort-on-container-exit
