#!/bin/bash
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//')
if [ "$DISK_USAGE" -gt 80 ]; then
  echo "Disk usage is above 80%: $DISK_USAGE%"
else
  echo "Disk usage is within limits: $DISK_USAGE%"
fi
