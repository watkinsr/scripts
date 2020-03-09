sbcl --control-stack-size 200 \
     --eval '(ql:quickload :doors)' \
     --eval '(defun climi::compile-time-clos-p (name) nil)' \
     --eval '(use-package :doors)' \
     --eval '(doors:doors :new-process t)'
