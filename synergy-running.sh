#!/bin/sh

if pgrep "synergy" >/dev/null 2>&1 ; then
	echo "[S]"
else
	echo "[]"
fi
