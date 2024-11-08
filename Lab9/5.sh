#!/bin/bash
ping -i 2 8.8.8.8 > /dev/null &
PID=$!
echo "Ping started with PID $PID"

# Define a cleanup function
cleanup() {
  echo "Terminating ping process..."
  kill $PID
  exit 0
}

# Trap SIGINT and SIGTERM signals
trap cleanup SIGINT SIGTERM

# Wait for the process to end
wait $PID
