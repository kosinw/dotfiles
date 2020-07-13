"
" ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
" ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
" ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
" ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
" ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"  ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
"  ░           ░  ░             ░        ░   ░         ░
"                               ░       ░
"
" author: kosinw <kosinwabueze@gmail.com>

" Disable vi compatibility mode
set nocompatible

" --- Leader key --- {{{
" Set the <leader> key
let mapleader=" "
" }}}
" --- Autocmds --- {{{
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Force vim to type ":nohl" on save
autocmd BufWritePre * :call feedkeys(":nohls\n")

" Turn off automatic comments
autocmd BufEnter * set fo-=c fo-=r fo-=o

" Enable folding for vimscript files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Enable <tab> for emmet completion in xhtml/html files
augroup emmet_tab
	autocmd!
	autocmd filetype html,xhtml,phtml,jsx,svelte,vue imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup END
" }}}
" --- Keybinds --- {{{
" Set vim to paste on next line
" p = (p)aste on next line
nnoremap <leader>p :pu<CR>

" Enable + disable auto commenting
" c = disable auto (c)ommenting; C = enable auto (C)ommenting
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions+=cro<CR>

" Enable + disable auto indentation
" i = disable auto (i)ndentation; I = enable auto (I)ndentation
map <leader>i :setlocal noautoindent<CR>
map <leader>I :setlocal autoindent<CR>

" Basic file system commands
nnoremap <A-e> :edit<Space>
nnoremap <A-o> :!touch<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-m> :!mv<Space>%<Space>

" Split navigation
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

" Split creation
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

" Tab navigation
nnoremap <A-p> :tabp<CR>
nnoremap <A-n> :tabn<CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" Shortcuts for save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq!<CR>

" Fix line wrapping
noremap <silent>j gj
noremap <silent>k gk

" DEBUGGING: Figure out what syntax element highlighted thing is
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Fuzzy file finder
nnoremap <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":Files\<cr>"
nnoremap <expr> <leader>b (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":Buffers\<cr>"
nnoremap <expr> <leader>h (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":History\<cr>"
nnoremap <expr> <leader>/ (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":BLines\<cr>"

" Set <leader>rc to edit dotfiles
nnoremap <expr> <leader>rc (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":Files ~/dotfiles\<cr>"

" Reload .vimrc
nnoremap <leader>R :so $MYVIMRC<CR>

" Toggle NERDTree sidebar
nnoremap <A-f> :exe "NERDTreeToggle" escape(getcwd(), ' ')<CR>
" }}}
" --- Plugins --- {{{
" Add .local/share/nvim to executable path
set runtimepath+=~/.local/share/nvim

" Download vim-plug if its not already downloaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug <https://github.com/junegunn/vim-plug>
call plug#begin('~/.local/share/nvim/plugged')

" automatically close xhtml tags
Plug 'alvan/vim-closetag'

" emmet abbreviations
Plug 'mattn/emmet-vim'

" lots of language syntax highlighting
Plug 'sheerun/vim-polyglot'

" commenting keybinds
Plug 'tpope/vim-commentary'

" quoting + surrounding
Plug 'tpope/vim-surround'

" netrw is bad, just use a real browser
Plug 'preservim/nerdtree'

" alignment
Plug 'tommcdo/vim-lion'

" jump to location
Plug 'justinmk/vim-sneak'

" vim + tmux integration
Plug 'christoomey/vim-tmux-navigator'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
" }}}
" --- Basic settings --- {{{
" Use system clipboard
set clipboard+=unnamedplus

" Enable mouse support (primarily for scrolling)
set mouse=a

" Cursor line
set cursorline

" Scroll the line before the bottom
set scrolloff=1

" Syntax highlighting (without overwriting syntax settings)
syntax enable

" Disable case sensitive searching
set ignorecase

" Incremental search
set incsearch

" Enable line numbers
set nu

" Disable line wrapping
set nowrap

" Disable mode at bottom
set noshowmode

" Colorschemes
set termguicolors
colorscheme pasteldark

" Fix tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Autocompletion
set wildignorecase
set wildmode=list:longest,full

" Fix splitting
set splitbelow splitright
" }}}
" --- netrw settings --- {{{
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
" }}}
" --- Plugin configurations --- {{{
" Close NERDTree if its the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files by default
let NERDTreeShowHidden=1

" Custom tmux-navigator mappings
let g:tmux_navigator_no_mappings = 1
" }}}
