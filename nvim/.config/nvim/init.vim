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

" --- Leader key --- {{{
" Set the <leader> key
let mapleader=" "
" }}}
" --- Autocmds --- {{{
" Autocenter document on insert
autocmd InsertEnter * norm zz

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
map <A-h> <C-w>h
map <A-l> <C-w>l
map <A-j> <C-w>j
map <A-k> <C-w>k

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

" Fix line wrapping
noremap j gj
noremap k gk

" DEBUGGING: Figure out what syntax element highlighted thing is
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Fuzzy file finder
nnoremap <C-p> :Files<CR>

" Toggle netrw sidebar
noremap <silent> <A-f> :call ToggleNetrw()<CR>
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

" alignment
Plug 'tommcdo/vim-lion'

" jump to location
Plug 'justinmk/vim-sneak'

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

" Syntax highlighting (without overwriting syntax settings)
syntax enable

" Disable case sensitive searching
set ignorecase

" Enable line numbers
set nu

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
let g:netrw_winsize=20

" Allow for netrw to be toggled
function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent exe "bwipeout " . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Lexplore
	endif
endfunction

" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

let g:NetrwIsOpen=0
" }}}
" --- Plugin configurations --- {{{
" }}}
