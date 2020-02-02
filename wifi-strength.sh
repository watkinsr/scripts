#!/bin/sh

# get wifi strength

SIG=$(iwconfig wlp3s0 | awk -F'[ :=]+' '/Signal/{s=$7}END{print s""f}')
echo WIFI:${SIG#-}%
