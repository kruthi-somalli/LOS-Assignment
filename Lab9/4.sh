#!/bin/bash
SUSPICIOUS_PROCESSES=("netcat" "nmap" "nc" "hping")
for name in "${SUSPICIOUS_PROCESSES[@]}"; do
  if pgrep -x "$name" > /dev/null; then
    echo "Suspicious process detected: $name"
  fi
done
