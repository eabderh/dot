


" write buffer
nnoremap <silent> 	<leader>w 		:w<CR>
" write buffer and exit (add a to avoid E173 error)
nnoremap <silent> 	<leader>x 		:xa<CR>
" force exit (add a to avoid E173 error)
nnoremap <silent> 	<leader>q 		:qa!<CR>
" remove buffer
nnoremap <silent> 	<leader>t 		:bd<CR>
nnoremap <silent> 	<leader>dd 		:bd<CR>
nnoremap <silent> 	<leader>DD 		:bd!<CR>
" reload buffer
nnoremap <silent> 	<leader>E 		:e!<CR>

" allow moving to next buffer without saving
set hidden


" next/previous buffer
nnoremap <silent> 	<leader>f 		:bnext<CR>
nnoremap <silent> 	<leader>s 		:bprevious<CR>
nnoremap <silent> 	. 				:bnext<CR>
nnoremap <silent> 	, 				:bprevious<CR>


" go to previously used buffer
nnoremap <silent> 	<leader>m 		:b#<CR>





