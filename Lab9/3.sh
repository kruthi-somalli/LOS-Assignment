#!/bin/bash
CPU_LIMIT=80
MEMORY_LIMIT=80
MALICIOUS_PROCESSES=("netcat" "nmap")
LOG_FILE="/var/log/terminated_processes.log"
log_termination() { echo "$(date): Terminated $1 (PID: $2) - CPU: $3%, MEM: $4%" >> $LOG_FILE; }
for pid in $(ps -eo pid --no-headers); do
  cpu=$(ps -p $pid -o %cpu= | awk '{print int($1)}')
  mem=$(ps -p $pid -o %mem= | awk '{print int($1)}')
  name=$(ps -p $pid -o comm=)
  if [ "$cpu" -gt "$CPU_LIMIT" ] || [ "$mem" -gt "$MEMORY_LIMIT" ] || [[ " ${MALICIOUS_PROCESSES[@]} " =~ " $name " ]]; then
    kill -9 $pid
    log_termination "$name" "$pid" "$cpu" "$mem"
  fi
done
