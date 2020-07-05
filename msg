#!/bin/sh

# Display dzen2 message
args="$*"

title="Msg: "
sizeArgs=${#args}
sizeTitle=${#title}
size=$(( sizeTitle + sizeArgs ))
width=$((10 * size))
height=20

x_axis=$(xrandr --current | awk 'NR==1{print $8}')
x_adjust=$(echo $( echo "$(echo "$width / $x_axis" | bc -l) * $(( $x_axis/ 2 ))" | bc -l) | awk '{print int($1+0.5)}')


x=$(($x_axis/2  - $x_adjust))

y_axis=$(xrandr --current | awk 'NR==1{print $10}' | sed 's/,//')

y=$(($y_axis / 2 - $(($y_axis/$height))))

# echo sizeTitle: $sizeTitle
# echo sizeArgs: $sizeArgs
# echo size: $size
# echo x_axis: $x_axis
# echo x_adjust: $x_adjust
# echo x: $x
# echo y_axis: $y_axis
# echo y: $y

if [ -n "$(command -v dzen2)" ]; then
  # Notify the command
  echo $title $args | dzen2 -p 1 -w $width -h $height -l 1 -x $x -y $y -ta c -sa c -e 'onstart=uncollapse' -bg black &
else
  echo "ERROR: need dzen2 to use this script"
fi
