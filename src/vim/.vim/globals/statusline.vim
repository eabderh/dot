
" always show statusbar
set laststatus=2

set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#



"set statusline+=%#StatusLineDark#

" filename
"set statusline+=%#StatusLine#
set statusline+=\ %f
"set statusline+=\ %m


"set statusline+=%m

" right align
set statusline+=%=

""set statusline+=%#CursorColumn#

" filetype
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %l/%L
set statusline+=\ %#StatusLineDark#
set statusline+=\ %y
set statusline+=\ %{&ff}
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %#StatusLine#
"set statusline+=\ %#CursorLineNr#
set statusline+=\ %3p%%
set statusline+=\ 
"set statusline+=\ %l:%c
"set statusline+=\
