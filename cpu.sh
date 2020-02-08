#!/bin/sh

# Show CPU Usage

CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU: $CPU"
