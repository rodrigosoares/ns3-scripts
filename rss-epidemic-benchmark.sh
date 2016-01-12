#!/bin/bash

# Place this file into NS-3 scratch folder.
# Give the shell permission to execute it: "chmod 755 rss-epidemic-benchmark.sh".
# Execute it with: "./rss-epidemic-benchmark.sh".

echo "Compiling and running WAF for rss-epidemic-benchmark.cc simulation script..."

# Define the number of runs to be simulated.
max_runs=10

# Check if this file is inside the scratch folder.
if [ $(basename "$PWD") == "scratch" ]; then
  cd ..
  ./waf

  for current_run in $(seq 1 $max_runs); do
    for range in 10 50 100; do
      ./waf --run "scratch/rss-epidemic-benchmark --txpDistance=$range.0 --hopCount=10 --queueLength=2000 --RngRun=$current_run"
      gzip rss-benchmark-range-$range-hops-10-buffer-2000-run-$current_run.trace
    done

    for hops in 2 4 8; do
      ./waf --run "scratch/rss-epidemic-benchmark --txpDistance=100.0 --hopCount=$hops --queueLength=2000 --RngRun=$current_run"
      gzip rss-benchmark-range-100-hops-$hops-buffer-2000-run-$current_run.trace
    done

    for buffer in 20 100 200; do
      ./waf --run "scratch/rss-epidemic-benchmark --txpDistance=100.0 --hopCount=10 --queueLength=$buffer --RngRun=$current_run"
      gzip rss-benchmark-range-100-hops-10-buffer-$buffer-run-$current_run.trace
    done
  done
else
  echo "This script is not inside the NS-3 scratch folder."
fi
