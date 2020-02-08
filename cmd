#!/bin/sh

# Do the command and notify what it was
args="$*"

title="Command: "
sizeArgs=${#args}
sizeTitle=${#title}
size=$(( sizeArgs > sizeTitle ? sizeArgs : sizeTitle ))
width=$((8 * size))
height=20

Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
xAdjust=$(echo $( echo "$(echo "$width / $Xaxis" | bc -l) * $(( $Xaxis / 2 ))" | bc -l) | awk '{print int($1+0.5)}')

# echo $var | awk '{print int($1+0.5)}'

X=$(($Xaxis/2  - $xAdjust))

echo $xAdjust

Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
Y=$(($Yaxis/2 - $(($Yaxis/$height))))

{ echo $title; echo $args; } | dzen2 -p 1 -w $width -h $height -l 1 -x $X -y $Y -ta c -sa c -e 'onstart=uncollapse' -fn Iosevka-Slab -bg black
$args
