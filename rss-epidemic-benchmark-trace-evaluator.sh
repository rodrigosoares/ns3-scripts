#!/bin/bash

# Place this file into NS-3 scratch folder.
# Give the shell permission to execute it: "chmod 755 rss-epidemic-benchmark-trace-evaluator.sh".
# Execute it with: "./rss-epidemic-benchmark-trace-evaluator.sh /path/to/folder/with/loop_folders".
#
# This script will access the folders buffer_length, hop_count and tx_distance
# inside the main folder passed by the user. Then, it will uncompress the .gz
# files and process them with the Ruby script. Finally, it will compress them
# back to .gz format. If the folders, extensions or the Ruby scripts have
# different names, this shell script must be adapted beforehand.

echo "SHELL: Creating CSV file from all traces found in main folder $1..."

# Checks if this file is inside the scratch folder.
if [ $(basename "$PWD") == "scratch" ]; then
  # Iterates over the trace folders.
  for folder in buffer_length hop_count tx_distance; do
    # Prevents *.trace/*.trace.gz from being created or processed.
    shopt -s nullglob
    # Iterates over all .trace.gz files and uncompresses them.
    for file in $1/$folder/*.trace.gz; do
      echo "SHELL: Uncompressing file $file"
      gunzip $file
    done
    # Iterates over all resulting .trace files, processes and compresses them back.
    for file in $1/$folder/*.trace; do
      echo "SHELL: Processing file $file"
      ruby rss-epidemic-benchmark-trace-evaluator.rb $file
      gzip $file
    done
  done
else
  echo "ERROR: This script is not inside the NS-3 scratch folder."
fi
