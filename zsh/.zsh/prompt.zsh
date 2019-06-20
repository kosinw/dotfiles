# ┏━┓┓━┓┳ ┳
# ┏━┛┗━┓┃━┫
# ┗━┛━━┛┇ ┻
#

# GEOMETRY_SYMBOL_PROMPT="▲"                  # default prompt symbol
# GEOMETRY_SYMBOL_RPROMPT="◇"                 # multiline prompts
# GEOMETRY_SYMBOL_EXIT_VALUE="△"              # displayed when exit value is != 0
# GEOMETRY_SYMBOL_ROOT="▲"                    # when logged in user is root

ICO_HEAD="▲"

COLOR_ROOT="%F{red}"
COLOR_USER="%F{white}"
COLOR_NORMAL="%F{white}"
PROMPT_STYLE="classic"

#█▓▒░ allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

#█▓▒░ colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

PROMPT='${USER_LEVEL}${ICO_HEAD} %~ '
