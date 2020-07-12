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

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "pasteldark"

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#e2e4e5 guibg=#0f0f0f guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings -- hi IncSearch guifg=#212121 guibg=#ffedc0 guisp=#ffedc0 gui=NONE ctermfg=234 ctermbg=223 cterm=NONE
hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi SignColumn guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Typedef guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Title guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=bold ctermfg=189 ctermbg=235 cterm=bold
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreCondit guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Include guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#121212 guibg=#4bb5d6 guisp=#4bb5d6 gui=bold ctermfg=233 ctermbg=74 cterm=bold
hi StatusLineNC guifg=#212121 guibg=#71deff guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi NonText guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi DiffText guifg=NONE guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=NONE ctermbg=160 cterm=NONE
hi ErrorMsg guifg=#1c1c1c guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=234 ctermbg=160 cterm=NONE
hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#71deff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Conditional guifg=#71deff guibg=NONE guisp=NONE gui=bold ctermfg=81 ctermbg=NONE cterm=bold
hi StorageClass guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Todo guifg=#ffedc0 guibg=#0f0f0f guisp=#0f0f0f gui=NONE ctermfg=223 ctermbg=233 cterm=NONE
hi Special guifg=#e2e4e5 guibg=#0f0f0f guisp=#0f0f0f gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
hi LineNr guifg=#e0e0e0 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#212121 guibg=#71deff guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi Label guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi PMenuSel guifg=#212121 guibg=#73eaff guisp=#73eaff gui=NONE ctermfg=234 ctermbg=81 cterm=NONE
hi Search guifg=#212121 guibg=#ffedc0 guisp=#ffedc0 gui=NONE ctermfg=234 ctermbg=223 cterm=NONE
hi Delimiter guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi Statement guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Comment guifg=#686868 guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=NONE
hi Character guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Float guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Number guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Operator guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
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
hi VertSplit guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi Exception guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi Keyword guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi Type guifg=#dea0ff guibg=NONE guisp=NONE gui=bold ctermfg=183 ctermbg=NONE cterm=bold
hi DiffChange guifg=#e2e4e5 guibg=#cd0000 guisp=#cd0000 gui=NONE ctermfg=254 ctermbg=160 cterm=NONE
hi Cursor guifg=#949494 guibg=#949494 guisp=#949494 gui=NONE ctermfg=246 ctermbg=246 cterm=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Error guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi PMenu guifg=#212121 guibg=#c0ffdd guisp=#c0ffdd gui=NONE ctermfg=234 ctermbg=158 cterm=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi Constant guifg=NONE guibg=#0f0f0f guisp=#0f0f0f gui=NONE ctermfg=NONE ctermbg=233 cterm=NONE
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi String guifg=#c0ffdd guibg=NONE guisp=NONE gui=NONE ctermfg=158 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi Repeat guifg=#c0ffdd guibg=NONE guisp=NONE gui=bold ctermfg=158 ctermbg=NONE cterm=bold
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Structure guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi Macro guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#212121 guibg=#71deff guisp=#71deff gui=bold ctermfg=234 ctermbg=81 cterm=bold
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
