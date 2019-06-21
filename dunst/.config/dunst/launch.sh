#!/bin/sh

source "$SCRIPTS/xcolors"

killall -q dunst

while pgrep -x dunst >/dev/null; do
    sleep 1
done

setsid dunst &
