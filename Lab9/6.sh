#!/bin/bash
if grep -q "Failed password" /var/log/auth.log; then
  echo "Failed login attempt detected!"
fi
