#!/bin/bash

# Start Asterisk
asterisk -c
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start asterisk: $status"
  exit $status
fi
