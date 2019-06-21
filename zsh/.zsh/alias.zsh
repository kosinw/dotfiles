# ┏━┓┓━┓┳ ┳
# ┏━┛┗━┓┃━┫
# ┗━┛━━┛┇ ┻
#

#█▓▒░ neovim
alias e="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

#█▓▒░ misc
alias xo="xdg-open"
alias wttr="curl wttr.in"
alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file
alias grep='grep --color'
alias mixer='alsamixer'

#█▓▒░ tmux
alias tmux='tmux -2'
alias t='tmux'
alias tk='tmux kill-session -t'
alias ta='tmux a -t'

#█▓▒░ yay / pacman
alias browser='yay -Qq | fzf --preview "yay -Qil {}" --layout=reverse --bind "enter:execute(yay -Qil {} | $PAGER)"'
alias inst='pacman -Slq | fzf -m --preview "pacman -Si {}" | xargs -r sudo pacman -S --noconfirm'
