#!/bin/bash
set -e

timestamp=$($(date +"%Y-%m-%dT%H-%M"))

one_hour_ago=$(date -d '1 hour ago' +"%Y-%m-%dT%H-%M")

logFile="kernel-logs-$timestamp.txt"

journalctl --since="$one_hour_ago" --no-pager > "kernel-logs-$timestamp.txt"
tar -czvf "kernel-logs-$timestamp.tar.gz" "kernel-logs-$timestamp.txt"

dbxcli put "kernel-logs-$timestamp.tar.gz" "logs/kernel-logs-$timestamp.tar.gz"

rm "kernel-logs-$timestamp.txt"
