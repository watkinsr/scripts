#!/bin/bash

vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
	  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
# function vol()
# {
#     while true
#     do
# 	vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    # 		  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
# 	echo "VOL:${vol}%"
# 	sleep 1
#     done
# }

echo "VOL:${vol}%"
