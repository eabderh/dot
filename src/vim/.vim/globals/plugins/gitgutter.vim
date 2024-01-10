
function MyGlobalSetColumn(isenabled)
	if a:isenabled
		setlocal signcolumn=yes
	else
		setlocal signcolumn=no
	endif
endfunction


function GitGutterToggle_Shim()

	"echom g:gitgutter_enabled
	call gitgutter#toggle()
	"if g:gitgutter_enabled
	"	let g:myglobalsigncolumn = 'yes'
	"	set signcolumn=yes
	"else
	"	let g:myglobalsigncolumn = 'no'
	"endif
	"exe 'set signcolumn='.g:myglobalsigncolumn
	call MyGlobalSetColumn(g:gitgutter_enabled)
endfunction



"nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>g :call GitGutterToggle_Shim()<CR>


let g:gitgutter_enabled = 1
"set signcolumn=no
"let g:myglobalsigncolumn = 'no'

"let g:gitgutter_highlight_linenrs = 1

let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_modified_removed = '>'
let g:gitgutter_async = 0

"let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_override_sign_column_highlight = 1
"let g:gruvbox_invert_signs = 1

"autocmd! gitgutter CursorHold,CursorHoldI
autocmd BufEnter,BufNewFile * call MyGlobalSetColumn(g:gitgutter_enabled)
"autocmd BufEnter,BufNewFile * exe 'set signcolumn='.g:myglobalsigncolumn
"autocmd BufEnter,BufNewFile * setlocal signcolumn=

"highlight SignColumn  ctermbg=235

