#!/bin/bash
ping -i 2 google.com > /dev/null &
PID=$!
cleanup() { echo "Terminating background process..."; kill $PID; exit 0; }
trap cleanup SIGINT
wait $PID
