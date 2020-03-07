#!/bin/sh

if pgrep "synergy" >/dev/null 2>&1 ; then
	echo -n "[S]"
else
	echo -n "[]"
fi
