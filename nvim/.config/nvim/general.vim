" ┏━┓┳━┓┏┓┓┳━┓┳━┓┳━┓┳   ┓ ┳o┏┏┓
" ┃ ┳┣━ ┃┃┃┣━ ┃┳┛┃━┫┃   ┃┏┛┃┃┃┃ 
" ┇━┛┻━┛┇┗┛┻━┛┇┗┛┛ ┇┇━┛o┗┛ ┇┛ ┇
"
" author: kosi <kosinwabueze@gmail.com>
" code: https://github.com/kosinw/dotfiles
"

" hide buffers, do not close them
set hidden

" undo history without swapfiles
set undofile
set undodir=~/.local/share/nvim/undo
set noswapfile

" case insensitive search
set ignorecase
set smartcase
set infercase

" always substitute all by default with /s
set gdefault

" fix backspace
set backspace=indent,eol,start

" better searching
set hlsearch
set incsearch
set inccommand=split

" indentation/tabulation (use tabs not spaces)
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" auto indentation
set autoindent

" set leaderkey to ,
let mapleader=","

" fix clipboard
set clipboard^=unnamedplus
