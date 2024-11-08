#!/bin/bash
find /tmp -type f -mtime +7 -exec rm -f {} \;
echo "/path/to/cleanup_tmp.sh" | at 2:00 AM tomorrow
