#!/bin/sh

# Sync Mail

export DISPLAY=:0
/usr/bin/notify-send "Sync mail job [BEGIN]";
/usr/bin/offlineimap;
/usr/bin/notify-send "Sync mail job [FINISH]";
