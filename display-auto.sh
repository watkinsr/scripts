#!/bin/ksh

# default monitor is LVDS-1
if [ $HOST="acer-void" ]; then
    echo "Acer detected"
    MONITOR1=eDP1
    MONITOR2=HDMI2
elif [ $HOST="x230.home" ]; then
    echo "X230 detected"
    MONITOR1=LVDS-1
    MONITOR2=VGA-1
else
    echo "ERROR: Unrecognised host to get monitors, expected acer/x230"
    return -1
fi;

# functions to switch from laptop to main monitor and vice versa
ActivateMain() {
    echo "Activate main"
    xrandr --output $MONITOR2 --auto --output $MONITOR1 --off
}
ActivateLaptop() {
    echo "Activate laptop"
    xrandr --output $MONITOR1 --off --output $MONITOR2 --auto
}

# functions to check if VGA is connected and in use
MainNotConnected() {
    ! xrandr | grep $MONITOR2 | grep disconnected
}

# actual script
if MainNotConnected
then
    ActivateMain
else
    ActivateLaptop
fi
