


" modes {}
" -----------------------------------------------------------------------------

" escape insert mode
inoremap jk 	<Esc>
" enter insert mode at end of line 
nnoremap o 		$a
" enter command mode
nnoremap ;; 	:
" enter block mode
nnoremap b 		<C-v>



" formatting
" -----------------------------------------------------------------------------

" delete all marked in visual mode
vnoremap t d
" delete line
nnoremap t dd
" copy line
nnoremap y yy
" make paragraph from one line (wrap)
nnoremap <silent> 	<leader>z 	gqgq
" make paragraph from multiple adjacent lines (wrap)
nnoremap <silent> 	<leader>: 	gqap



" commands
" -----------------------------------------------------------------------------

" time and date insert
nnoremap <F5> 	"=strftime("[%F %T %z %s]")<CR>P
inoremap <F5> 	<C-R>=strftime("[%F %T %z %s]")<CR>

" redo
nnoremap U <C-R>

" edit file (useful for updating file after external writes to file)
nnoremap <silent> <leader>e :edit<CR>



" search & replace
" -----------------------------------------------------------------------------

" replace all highlighted
nnoremap <leader>r :%s///gc<left><left><left>
" replace all highlighted in section
vnoremap <leader>r :s///gc<left><left><left>
" turn off incremental search results
set noincsearch
" turn on highlighting of searches
set hlsearch



