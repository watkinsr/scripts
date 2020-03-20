#!/bin/sh

if pgrep "wpa_supplicant" >/dev/null 2>&1 ; then
	doas pkill -9 wpa_supplicant
fi

if pgrep "dhcpcd" >/dev/null 2>&1 ; then
	doas pkill -9 dhcpcd
fi

# start wireless
doas wpa_supplicant -Dnl80211 -iwlp3s0 -c/home/ryan/4g.conf -B;
doas dhcpcd wlp3s0;
notify-send "Switching to mobile net"
