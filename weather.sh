#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#USAGE: weather.sh <locationcode>
#(c) Michael Seiler 2007

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
LOC=$1
if [ -z $1 ]; then
    LOC="London"
    # echo
    # echo "USAGE: weather.sh <locationcode>"
    # echo
    # exit 0;
fi

curl --connect-timeout 30 -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$LOC | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'
