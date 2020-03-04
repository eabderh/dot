
let mapleader='m'

" insert mode
" -----------------------------------------------------------------------------

inoremap jk <Esc>




" normal mode
" -----------------------------------------------------------------------------

" TODO: label
nnoremap U <C-R>
nnoremap cl cc
nnoremap cc ciw
nnoremap b <C-v>

" move forward
nnoremap f w
nnoremap F $
" move backwards
nnoremap s b
nnoremap S 0
" move up
nnoremap e 8k
nnoremap E 16k
" move down
nnoremap d 8j
nnoremap D 16j




" visual mode
" -----------------------------------------------------------------------------

vnoremap t d

" move forward
vnoremap f e
vnoremap F $
" move backwards
vnoremap s b
vnoremap S 0
" move up
vnoremap e 8k
vnoremap E 16k
" move down
vnoremap d 8j
vnoremap D 16j




" buffer
" -----------------------------------------------------------------------------

" buffer next
nnoremap <silent> <leader>f :w<CR>:bnext<CR>
nnoremap <silent> . :w<CR>:bnext<CR>
" buffer prev
nnoremap <silent> <leader>s :w<CR>:bprevious<CR>
nnoremap <silent> , :w<CR>:bprevious<CR>
" close current buffer
nnoremap <leader>dd :bd<CR>
nnoremap <silent> <leader>t :bd<CR>

" unused
"nnoremap <silent> <leader>F :bnext<CR>
"nnoremap <silent> <leader>S :bprevious<CR>
"nnoremap <silent> <leader>m :b#<CR>
"nnoremap <leader>i :b




" saving
" -----------------------------------------------------------------------------

" write
nnoremap <silent> <leader>w :w<CR>
" write and exit
nnoremap <silent> <leader>x :xa<CR>
" quit without saving
nnoremap <silent> <leader>q :q!<CR>
" reload file
nnoremap <silent> <leader>e :e<CR>




" paragraph
" -----------------------------------------------------------------------------

" paragraph maker
nnoremap <silent> <leader>p gqgq
nnoremap <silent> <leader>P gqap







" copy/delete line
" -----------------------------------------------------------------------------

" delete line
nnoremap t dd
" copy line
nnoremap y yy






" foldings
" -----------------------------------------------------------------------------

nnoremap zz zA
nnoremap zm zM
nnoremap zr zR




" windows
" -----------------------------------------------------------------------------

" split window horizontally
nnoremap w; :split<CR>
" split window vertically
nnoremap w' :vsplit<CR>

" move up one window
nnoremap wj <C-w>j
" move down one window
nnoremap wk <C-w>k
" move left one window
nnoremap wh <C-w>h
" move right one window
nnoremap wl <C-w>l

"nnoremap we :only<CR>




" other
" -----------------------------------------------------------------------------

" undo highlighting
nnoremap <silent> <leader>a :let @/ = ""<CR>




" TEXT
" -----------------------------------------------------------------------------





" -----------------------------------------------------------------------------
