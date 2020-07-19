#
#      ▒███████▒  ██████  ██░ ██  ██▀███   ▄████▄
#      ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█
#      ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄
#        ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
#  ██▓ ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
#  ▒▓▒ ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
#  ░▒  ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒
#  ░   ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░
#   ░    ░ ░          ░   ░  ░  ░   ░     ░ ░
#   ░  ░                                  ░
#
# author: kosinw <kosinwabueze@gmail.com>

# --- fzf ---
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Use fd for fzf
export FZF_DEFAULT_COMMAND='fd --hidden --follow --no-ignore --exclude ".git"'

# show tree output when changin dirs
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# --- Environment ---
# include bin directory if it exists
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

export EDITOR=nvim
export TERMINAL=alacritty
export VISUAL=nvim

# --- Aliases ---
# replace neovim for vim
command -v nvim > /dev/null && alias vim="nvim" vimdiff="nvim -d"

# tmux
alias tmux='tmux -2'
alias tk='tmux kill-session -t'
alias ta='tmux a -t'

# man
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# verbosity
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \

# colorization
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

# abbreviations
alias \
	ka="killall" \
	f="$FILE" \
	e="$EDITOR" \
	v="$EDITOR" \

# --- History ---
# set history file
HISTFILE=~/.local/share/zsh/.zhistory

# other history settings
setopt APPEND_HISTORY
HISTSIZE=1200
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# --- Setopt ---
# turn off annoying beep
unsetopt BEEP

# --- Prompt ---
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Change directories using lf <C-o>
bindkey -s '^o' 'lfcd\n'

# Change directories using fzf <C-f>
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# Prompt
PROMPT="%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[green]%}%M%{$fg[magenta]%}%{$reset_color%}%b :: %{$fg[faint]%}%~ %{$reset_color%}%b» "

# source the plugin https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kosi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kosi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kosi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kosi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

