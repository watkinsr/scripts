# Xephyr :3 -resizeable -screen 1366x768 &


# DISPLAY=:3 sh ~/scripts/input.sh &

# DISPLAY=:3
sbcl --control-stack-size 1024 \
     --dynamic-space-size 1024 \
     --eval '(ql:quickload :doors)' \
     --eval '(use-package :doors)' \
     --eval '(defmethod clim:sheet-native-transformation ((x null)) climi::+identity-transformation+)' \
     --eval '(doors:doors)'
