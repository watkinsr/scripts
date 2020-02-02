#!/bin/sh

# Get cmus now playing info

cur=$(cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- )
# echo $cur
artist=$(echo -e "$cur" | head -n 2 | tail -n 1)
title=$(echo -e "$cur" | head -n 1 )
# echo $artist
# echo $title

echo $artist - $title
