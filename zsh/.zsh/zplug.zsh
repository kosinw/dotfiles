# ┏━┓┓━┓┳ ┳
# ┏━┛┗━┓┃━┫
# ┗━┛━━┛┇ ┻
#

#█▓▒░ set zplug path
if [[ -z $ZPLUG_HOME ]]; then
    export ZPLUG_HOME=$HOME/.local/share/zplug
fi

#█▓▒░ Install zplug if it does not exist
[ -d $ZPLUG_HOME ] || source $HOME/.zsh/zplug/installer.zsh

#█▓▒░ initialize zplug
source "$ZPLUG_HOME/init.zsh"

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load
