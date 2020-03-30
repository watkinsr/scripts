# setxkbmap -model 'pc104caw-zqu' -layout 'us(cmk_ed_us)' -option 'misc:cmk_curl_dh';

# doas bash ~/Git/Projects/BigBagKbdTrixXKB/install-dreymar-xmod.sh -ox 4a us us
# setxkbmap -option caps:escape -v us -variant colemak;

xset r rate 300 50 &

# Increase mouse speed
# xinput set-prop 12 165 2.400000, 0.000000, 0.000000, 0.000000, 2.400000, 0.000000, 0.000000, 0.000000, 1.000000

# Remove cursor while typing
# xbanish &

# Change X shaped default cursor

# The default X shaped Xcursor appears in window managers that do not set the default cursor to
# left_ptr or in window managers using XCB (like awesome) instead of Xlib.

# To fix this simply add the following to your ~/.xinitrc , xsession or window managers startup configuration if possible (for example bspwm's bspwmrc).
# xsetroot -cursor_name left_ptr
