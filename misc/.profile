#!/bin/sh

# Start graphical server if bspwm is not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx
