#!/bin/sh

# Restart xmobar
if pgrep "xmobar" >/dev/null 2>&1 ; then
	pkill -9 xmobar
fi

sh /home/ryan/scripts/run_xmobar.sh
