
set path+=$GOPATH/src
set path+=$GOROOT/src

execute "set path+=" . system("fdu vendor")

let g:go_highlight_trailing_whitespace_error=0

nnoremap <silent> ;i :GoImports<CR>

inoremap " '
inoremap ' "


