# ┳━┓┳  o┳━┓┓━┓┳━┓┓━┓ ┏━┓┓━┓┳ ┳
# ┃━┫┃  ┃┃━┫┗━┓┣━ ┗━┓ ┏━┛┗━┓┃━┫
# ┛ ┇┇━┛┇┛ ┇━━┛┻━┛━━┛o┗━┛━━┛┇ ┻
#
# author: kosi <kosinwabueze@gmail.com>
# code: https://github.com/kosinw/dotfiles
#

#█▓▒░ aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias e="$EDITOR"
alias ls="ls -hF --color=auto"
alias ll="ls -lahF --color=auto"
alias lsl="ls -lhF --color=auto"

#█▓▒░ tmux
function t() {
  X=$#
  [[ $X -eq 0 ]] || X=X
  tmux new-session -A -s $X
}

#█▓▒░ startx
alias x="startx"
