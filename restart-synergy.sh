#!/bin/sh

# Restart synergy
if pgrep "synergy" >/dev/null 2>&1 ; then
	pkill -9 synergy
fi

synergys --config /home/ryan/.config/synergy.conf
