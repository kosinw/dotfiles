" o┏┓┓o┏┓┓ ┓ ┳o┏┏┓
" ┃┃┃┃┃ ┃  ┃┏┛┃┃┃┃ 
" ┇┇┗┛┇ ┇ o┗┛ ┇┛ ┇
"
" author: kosi <kosinwabueze@gmail.com>
" code: https://github.com/kosinw/dotfiles
"
let configs = [
\  "general"
\ ]

for file in configs
    let x = expand("~/.config/nvim/".file.".vim")
    if filereadable(x)
        execute 'source' x
    endif
endfor
