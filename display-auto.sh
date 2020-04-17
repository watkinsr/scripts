#!/bin/ksh

# default monitor is LVDS-1
MONITOR=LVDS-1

# functions to switch from LVDS-1 to VGA and vice versa
function ActivateVGA {
    xrandr --output VGA-1 --auto --output LVDS-1 --off
    MONITOR=VGA-1
}
function DeactivateVGA {
    xrandr --output VGA-1 --off --output LVDS-1 --auto
    MONITOR=LVDS-1
}

# functions to check if VGA is connected and in use
function VGAConnected {
    ! xrandr | grep "^VGA-1" | grep disconnected
}

# actual script
if VGAConnected
then
    ActivateVGA
else
    DeactivateVGA
fi
