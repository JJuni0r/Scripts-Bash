#!/bin/bash

AUTH_LOG="/var/log/auth.log"
OUTPUT_FILE="log_analysis.txt"

analyze_auth_log() {
  echo "Security Analysis Report - $(date)" > "$OUTPUT_FILE"
  echo "-------------------------------------" >> "$OUTPUT_FILE"
  failed_logins=$(grep 'Failed password' "$AUTH_LOG")
  if [ -n "$failed_logins" ]; then
    echo "Failed Login Attempts:" >> "$OUTPUT_FILE"
    echo "$failed_logins" >> "$OUTPUT_FILE"
    echo "-------------------------------------" >> "$OUTPUT_FILE"
  fi
  successful_logins=$(grep 'Accepted password' "$AUTH_LOG")
  if [ -n "$successful_logins" ]; then
    echo "Successful Logins:" >> "$OUTPUT_FILE"
    echo "$successful_logins" >> "$OUTPUT_FILE"
    echo "-------------------------------------" >> "$OUTPUT_FILE"
  fi
  echo "Analysis completed. Results saved in $OUTPUT_FILE"
}
analyze_auth_log
