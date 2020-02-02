#!/bin/sh
# free --mebi -s 2
free -m | awk 'NR==2{printf "MEM: %s/%sMB\n", $3,$2,$3*100/$2 }'
