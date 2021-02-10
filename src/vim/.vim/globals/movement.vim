
" normal
"
"nnoremap cl cc
"nnoremap cc ciw


" down/up (even with wrap text)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" right/left one word (goes to first letter except in visual)
nnoremap f w
nnoremap s b
vnoremap f e
vnoremap s b

" right/left all the way
nnoremap F $
nnoremap S 0
vnoremap F $
vnoremap S 0

" down/up 8 lines
nnoremap d 8j
nnoremap e 8k
vnoremap d 8j
vnoremap e 8k

" down/up 16 lines
nnoremap D 16j
nnoremap E 16k
vnoremap D 16j
vnoremap E 16k

" set keys that wrap to next line
set whichwrap=h,l



