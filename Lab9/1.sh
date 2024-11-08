#!/bin/bash
MONITORED_DIR="/path/to/your/directory"
cleanup() { echo "Exiting... Stopping monitoring."; exit 0; }
trap cleanup SIGINT
echo "Monitoring directory: $MONITORED_DIR"
while true; do
  inotifywait -e modify,create,delete -r "$MONITORED_DIR"
  echo "Change detected in $MONITORED_DIR"
done
