#!/bin/sh

# Show CPU Usage

top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}' | tr -d '\n'
