#!/usr/bin/env python3
import sys
import os
import glob
import json
import re
# from kitchen.text.converters import to_bytes, to_unicode

curr = os.popen('xdotool get_desktop').read().strip()
numtotal = os.popen('xdotool get_num_desktops').read().strip()

curr = int(curr)
numtotal = int(numtotal)

re_ws = re.compile('\s+')

try:
    wm_info = os.popen('wmctrl -m').readlines()
    wm_name = [x for x in wm_info if 'Name:' in x]
    wm_name = wm_name[0].strip().replace('Name: ', '')
except:
    exit() # probably no wm

windows = os.popen("wmctrl -l").readlines()
used_windows = [int(re_ws.split(w)[1]) for w in windows]
used_windows = set(used_windows)

workspace_map = {"1": "dev", "2": "web(dev)", "3": "web(dev-2)", "4": "web", "5": "slack", "6": "vid", "7": "music", "8": "irc", "9": "read", "0": "sys"}

def xmobar_color(s, col):
    ws = workspace_map[str(s)]
    # print(workspace_map[str(s)])
    if col is None:
        return ws
    else:
        return '<fc={}>{}</fc>'.format(col, ws)

out = []
for i in range(int(numtotal)):
    if i == curr:
        # col = "#c84c00"
        col = "#e67128"
    elif i in used_windows:
        col = None
    else:
        col = "#606060"
    # if wm_name == 'LG3D' or wm_name == 'EXWM': # xmonad
    index = (i+1) % 10
    s = xmobar_color(index, col)
    out.append(s)

print('  '.join(out))
