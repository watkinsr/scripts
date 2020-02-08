#!/bin/sh

# Do the command and notify-send what it was
args="$*"

DISPLAY=:0 notify-send -t 5000 "command" "$args"
$args
