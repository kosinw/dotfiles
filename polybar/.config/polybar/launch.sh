#!/bin/sh

# ┳━┓┏━┓┳  ┓ ┳┳━┓┳━┓┳━┓
# ┃━┛┃ ┃┃  ┗┏┛┃━┃┃━┫┃┳┛
# ┇  ┛━┛┇━┛ ┇ ┇━┛┛ ┇┇┗┛
# 
# author: kosi <kosinwabueze@gmail.com>
# code: https://github.com/kosinw/dotfiles


killall -q polybar

while pgrep -x polybar > /dev/null; do
	sleep 1
done

setsid polybar top &
