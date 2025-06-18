#!/bin/bash
SCRIPT_DIR=/home/ubuntu/openadkit_demo.autoware/docker

export CONF_FILE_FAIL=$SCRIPT_DIR/etc/simulation/config/fail_static_obstacle_avoidance.param.yaml
export CONF_FILE=$CONF_FILE_FAIL
export COMMON_FILE=$SCRIPT_DIR/etc/simulation/config/common.param.yaml
export NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN
export NGROK_URL=$NGROK_URL
export TIMEOUT=300

# Start visualizer once
docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" up visualizer -d
echo "Waiting 10 seconds for visualizer to start..."
sleep 10

# Run simulator scenario 3 times
for i in {1..3}; do
  echo "Running simulator demo round $i..."
  docker compose -f "$SCRIPT_DIR/docker-compose-2ins.yml" run --rm simulator
  echo "Round $i complete. Waiting 5 seconds before next run..."
  sleep 5
done

echo "All simulator runs complete."
