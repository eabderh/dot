
" split horizontal/vertical
nnoremap w; 	:split<CR>
nnoremap w' 	:vsplit<CR>


" move to window down/up/left/right
nnoremap wj 	<C-w>j
nnoremap wk 	<C-w>k
nnoremap wh 	<C-w>h
nnoremap wl 	<C-w>l

" make window sizes equal
"nnoremap w= 	<C-w>=

" exit window mode
nnoremap <silent> 	wq 			:close<CR>
nnoremap <silent> 	ww 			:only<CR>
nnoremap <silent> 	we 			:only<CR>
nnoremap <silent> 	wdd 		:close<CR>
"nnoremap <silent> 	w<space> 	:vertical sball 4<CR>
nnoremap <silent> 	w= 			:sball 3<CR>
"nnoremap <silent> 	w- 			:vertical sball 4<CR>
nnoremap <silent> 	w- 			:vertical sball<CR><C-w>=
"nnoremap <silent> 	w= 			:windo wincmd H<CR>
"nnoremap <silent> 	w- 			:windo wincmd K<CR>




