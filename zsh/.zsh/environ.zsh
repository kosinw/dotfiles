# ┳━┓┏┓┓┓ ┳o┳━┓┏━┓┏┓┓ ┏━┓┓━┓┳ ┳
# ┣━ ┃┃┃┃┏┛┃┃┳┛┃ ┃┃┃┃ ┏━┛┗━┓┃━┫
# ┻━┛┇┗┛┗┛ ┇┇┗┛┛━┛┇┗┛o┗━┛━━┛┇ ┻
#
# author: kosi <kosinwabueze@gmail.com>
# code: https://github.com/kosinw/dotfiles
#

#█▓▒░ path
PATH=$PATH

if [ -d "$HOME/bin" ]; then
    PATH=$HOME/bin:$PATH
fi

export PATH

#█▓▒░ preferred text manipulators
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
