#!/bin/sh

# Do the command and notify what it was
args="$*"

title="Command: "
sizeArgs=${#args}
sizeTitle=${#title}
size=$(( sizeArgs > sizeTitle ? sizeArgs : sizeTitle ))
width=$((20 * size))
height=20

x_axis=$(xrandr --current | awk 'NR==1{print $8}')
x_adjust=$(echo $( echo "$(echo "$width / $x_axis" | bc -l) * $(( $x_axis/ 2 ))" | bc -l) | awk '{print int($1+0.5)}')
echo "x_axis: $x_axis"
echo "x_adjust: $x_adjust"

x=$(($x_axis/2  - $x_adjust))
echo "x: $x"


y_axis=$(xrandr --current | awk 'NR==1{print $10}' | sed 's/,//')
echo "y_axis: $y_axis"

y=$(($y_axis / 2 - $(($y_axis/$height))))

echo "y: $y"

program=$1

if [ -n "$(command -v dzen2)" ]; then
    if [ -n "$(command -v $program)" ]; then

        # Notify the command
        echo $title $args | dzen2 -p 1 -w $width -h $height -l 1 -x $x -y $y -ta c -sa c -e 'onstart=uncollapse' -bg black &

        # Do the command
        $args
    else
        echo "ERROR: need $program to use this script"
    fi
else
    echo "ERROR: need dzen2 to use this script"
fi
