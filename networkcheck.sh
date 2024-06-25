#!/bin/bash

OUTPUT_FILE="network_analysis.txt"
monitor_network() {
  echo "Network Analysis Report - $(date)" > "$OUTPUT_FILE"
  echo "-------------------------------------" >> "$OUTPUT_FILE"
  tcpdump -i any -c 50 -w captured_traffic.pcap
  established_connections=$(netstat -atn | grep ESTABLISHED)
  if [ -n "$established_connections" ]; then
    echo "Established Connections:" >> "$OUTPUT_FILE"
    echo "$established_connections" >> "$OUTPUT_FILE"
    echo "-------------------------------------" >> "$OUTPUT_FILE"
  fi
  echo "Network analysis completed. Results saved in $OUTPUT_FILE"
}
monitor_network
