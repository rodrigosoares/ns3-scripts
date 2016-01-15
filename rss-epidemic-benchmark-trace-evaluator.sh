#!/bin/bash

# Place this file into NS-3 scratch folder.
# Give the shell permission to execute it: "chmod 755 rss-epidemic-benchmark-trace-evaluator.sh".
# Execute it with: "./rss-epidemic-benchmark-trace-evaluator.sh".

echo "Creating CSV file from all traces found..."

# Check if this file is inside the scratch folder.
if [ $(basename "$PWD") == "scratch" ]; then
  cd $1

  for folder in buffer_length hop_count tx_distance; do
    echo "$1/$folder"
  done
else
  echo "This script is not inside the NS-3 scratch folder."
fi
