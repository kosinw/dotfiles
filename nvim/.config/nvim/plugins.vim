" ┳━┓┳  ┳ ┓┏━┓o┏┓┓┓━┓ ┓ ┳o┏┏┓
" ┃━┛┃  ┃ ┃┃ ┳┃┃┃┃┗━┓ ┃┏┛┃┃┃┃ 
" ┇  ┇━┛┇━┛┇━┛┇┇┗┛━━┛o┗┛ ┇┛ ┇
"
" author: kosi <kosinwabueze@gmail.com>
" code; https://github.com/kosinw/dotfiles
"

set runtimepath+=~/.local/share/nvim

" download plug.vim if not available
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.local/share/nvim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.local/share/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.local/share/nvim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.local/share/nvim/plugged')

" colors
Plug 'xero/sourcerer.vim'

" programming
Plug 'sheerun/vim-polyglot'

" ui elements
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/colorizer'
Plug 'chrisbra/unicode.vim'

" features
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'

" tmux integration
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'

call plug#end()
