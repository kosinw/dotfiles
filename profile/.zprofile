#!/bin/sh

# ┳━┓┳━┓┏━┓┳━┓o┳  ┳━┓
# ┃━┛┃┳┛┃ ┃┣━ ┃┃  ┣━ 
# ┇  ┇┗┛┛━┛┇  ┇┇━┛┻━┛
#

# Start graphical server if bspwm is not already running
[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx
