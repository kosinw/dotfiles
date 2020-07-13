"
"  ██▓███   ▄▄▄        ██████ ▄▄▄█████▓▓█████  ██▓    ▓█████▄  ▄▄▄       ██▀███   ██ ▄█▀
" ▓██░  ██▒▒████▄    ▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██▒    ▒██▀ ██▌▒████▄    ▓██ ▒ ██▒ ██▄█▒
" ▓██░ ██▓▒▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░▒███   ▒██░    ░██   █▌▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░
" ▒██▄█▓▒ ▒░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██░    ░▓█▄   ▌░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄
" ▒██▒ ░  ░ ▓█   ▓██▒▒██████▒▒  ▒██▒ ░ ░▒████▒░██████▒░▒████▓  ▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄
" ▒▓▒░ ░  ░ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░▓  ░ ▒▒▓  ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒
" ░▒ ░       ▒   ▒▒ ░░ ░▒  ░ ░    ░     ░ ░  ░░ ░ ▒  ░ ░ ▒  ▒   ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░
" ░░         ░   ▒   ░  ░  ░    ░         ░     ░ ░    ░ ░  ░   ░   ▒     ░░   ░ ░ ░░ ░
"                ░  ░      ░              ░  ░    ░  ░   ░          ░  ░   ░     ░  ░
"                                                      ░
" author: kosinw <kosinwabueze@gmail.com>

" --- Metadata --- {{{
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "pasteldark"
" }}}
" --- Statusline --- {{{
" Colors
hi Base guibg=#212333 guifg=#212333
hi Mode guibg=#71deff guifg=#181824 gui=bold
hi Git guibg=#292d3e guifg=#929dcb
hi Filetype guibg=#292d3e guifg=#929dcb
hi LineCol guibg=#71deff guifg=#181824 gui=bold

" Mode to name
let g:currentmode={
			\'n'  : 'Normal ',
			\'no' : 'N·Operator Pending ',
			\'v'  : 'Visual ',
			\'V'  : 'V-Line ',
			\'^V' : 'V-Block ',
			\'s'  : 'Select ',
			\'S'  : 'S-Line ',
			\'^S' : 'S-Block ',
			\'i'  : 'Insert ',
			\'R'  : 'Replace ',
			\'Rv' : 'V·Replace ',
			\'c'  : 'Command ',
			\'cv' : 'Vim Ex ',
			\'ce' : 'Ex ',
			\'r'  : 'Prompt ',
			\'rm' : 'More ',
			\'r?' : 'Confirm ',
			\'!'  : 'Shell ',
			\'t'  : 'Terminal '
			\}

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V-Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    hi Modi guifg=#efefef guibg=#212333 gui=bold
    hi Filename guifg=#efefef guibg=#212333
    return expand('%:t').'*'
  else
    hi Modi guifg=#929dcb guibg=#212333
    hi Filename guifg=#929dcb guibg=#212333
    return expand('%:t')
  endif
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Active statusline
function! ActiveLine()
	let statusline = "%#Base#"

	let statusline .= "%#Mode# %{ModeCurrent()}"

	let statusline .= "%#Base#"
	let statusline .= "%="

	let statusline .= "%#Modi# %{CheckMod(&modified)} "
	let statusline .= "%#Filetype# %{CheckFT(&filetype)} "

	" Current line and column
	let statusline .= "%#LineCol# Ln %l, Col %c "

	return statusline
endfunction

" Set NERDTree statusline
function! NERDLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " NERDTree title
  let statusline .= "%#Mode# NERDTree "
  let statusline .= "%#Base#"

  return statusline
endfunction

" Inactive statusline
function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
  autocmd FileType nerdtree setlocal statusline=%!NERDLine()
augroup END

set laststatus=2
"}}}
" --- Colorscheme {{{
hi Normal guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi SignColumn guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Typedef guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi Title guifg=#F9F9FF guibg=None guisp=#192224 gui=NONE ctermfg=189 ctermbg=235 cterm=NONE
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreCondit guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Include guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi TabLineSel guifg=#121212 guibg=#4bb5d6 guisp=#4bb5d6 gui=bold ctermfg=233 ctermbg=74 cterm=bold
hi StatusLineNC guifg=#e0e0e0 guibg=#212333 guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi NonText guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi DiffText guifg=NONE guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=NONE ctermbg=160 cterm=NONE
hi ErrorMsg guifg=#e0e0e0 guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=234 ctermbg=160 cterm=NONE
hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Conditional guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
" hi StorageClass guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Todo guifg=#ffedc0 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=223 ctermbg=233 cterm=NONE
hi Special guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi LineNr guifg=#e0e0e0 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi CursorLineNr guifg=#ffedc0 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#212121 guibg=#71deff guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi Label guifg=#ffedc0 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi PMenuSel guifg=#212121 guibg=#73eaff guisp=#73eaff gui=NONE ctermfg=234 ctermbg=81 cterm=NONE
hi Search guifg=#212121 guibg=#ffedc0 guisp=#ffedc0 gui=NONE ctermfg=234 ctermbg=223 cterm=NONE
hi IncSearch guifg=#212121 guibg=#cdcd00 guisp=#ffedc0 gui=NONE ctermfg=234 ctermbg=223 cterm=NONE
hi Delimiter guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi Statement guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Comment guifg=#686868 guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=NONE
hi Character guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Float guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Number guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Operator guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi CursorLine guifg=NONE guibg=#212121 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLineFill guifg=NONE guibg=#71deff guisp=#71deff gui=bold ctermfg=NONE ctermbg=81 cterm=bold
hi WarningMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi VisualNOS guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline ctermfg=235 ctermbg=189 cterm=underline
hi DiffDelete guifg=NONE guibg=#192224 guisp=#192224 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi ModeMsg guifg=#F9F9F9 guibg=#192224 guisp=#192224 gui=bold ctermfg=15 ctermbg=235 cterm=bold
hi CursorColumn guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Define guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Function guifg=#e0e0e0 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
hi FoldColumn guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreProc guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Visual guifg=#303030 guibg=#F9F9FF guisp=#F9F9FF gui=NONE ctermfg=236 ctermbg=189 cterm=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi VertSplit guifg=#e0e0e0 guibg=NONE guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi Exception guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi Keyword guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi Type guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi DiffChange guifg=#e2e4e5 guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=254 ctermbg=160 cterm=NONE
hi Cursor guifg=#949494 guibg=#949494 guisp=#949494 gui=NONE ctermfg=246 ctermbg=246 cterm=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Error guifg=#e0e0e0 guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=234 ctermbg=160 cterm=NONE
hi PMenu guifg=#212121 guibg=#c0ffdd guisp=#c0ffdd gui=NONE ctermfg=234 ctermbg=158 cterm=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi Constant guifg=NONE guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=NONE ctermbg=233 cterm=NONE
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi String guifg=#c0ffdd guibg=NONE guisp=NONE gui=NONE ctermfg=158 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi MatchParen guifg=#ffdec0 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi Repeat guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Type guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
" hi Macro guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#212121 guibg=#71deff guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
"}}}
" --- HTML specific {{{
hi htmlLink guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi htmlEndTag guifg=#e2e4e5 guibg=NONE guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
" }}}
