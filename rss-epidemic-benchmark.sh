#!/bin/bash

# Place this file into NS-3 scratch folder.
# Give the shell permission to execute it: "chmod 755 rss-epidemic-benchmark.sh".
# Execute it with: "./rss-epidemic-benchmark.sh".

echo "Compiling and running WAF for rss-epidemic-benchmark.cc simulation script..."

# Define the number of runs to be simulated.
max_runs=10

# Check if this file is inside the scratch folder.
if [ $(basename "$PWD") == "scratch" ];
then
  $(../waf)
  for current_run in $(seq 1 $max_runs);
  do
    $(../waf --command-template="%s --RngRun=$current_run" --run rss-epidemic-benchmark)
  done
else
  echo "This script is not inside the NS-3 scratch folder."
fi