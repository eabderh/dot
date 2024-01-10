
" file explorer
"Plugin 'Shougo/unite.vim'


nnoremap <leader>u :Unite file<CR>

"call unite#custom#source('file', 'ignore_pattern', '\%(^\|/\).')
"call unite#custom#source('file', 'ignore_pattern', '\.')
"call unite#custom#source('file', 'ignore_globs', ['**/.'])

" https://localcoder.org/how-to-get-visually-selected-text-in-vimscript
function! VisualSelection()
	try
		let a_save = @a
		normal! gv"ay
		return @a
	finally
		let @a = a_save
	endtry
endfunction

function! Unite_Shim(path)
	call unite#start([['file', a:path]], {
		\ 'no_split': 1,
		\ 'start_insert': 0,
		\ })
		"\ 'unite__is_manual': 0,
		"\ 'input': a:path,
endfunction
nnoremap gf :call Unite_Shim(expand("<cfile>"))<CR>
vnoremap gf :call Unite_Shim(VisualSelection())<CR>


"nnoremap gf :Unite -input=`expand("<cfile>")`<CR>
"nnoremap gf :UniteWithCursorWord file buffer<CR>

" https://github.com/Shougo/vimfiler.vim/blob/0fdf9f2f7e6014a49625433058c1665f72a3b86f/plugin/vimfiler.vim#L72-L97
" https://github.com/preservim/nerdtree/blob/81f3eaba295b3fceb2d032db57e5eae99ae480f8/plugin/NERD_tree.vim#L155-L160
" https://github.com/preservim/nerdtree/blob/e731b845590017493224dfcb7403c2332105b700/autoload/nerdtree.vim#L61-L71

let loaded_netrwPlugin = 1

function! s:browse_check(path)

	if &filetype ==# 'unite'
		return
	endif
	if !isdirectory(a:path)
		return
	endif

	call unite#start([['file', a:path], ['buffer']], {})
	"call unite#start([['file', a:path], ['buffer']], {
	"	\ 'unite__is_manual': 0,
	"	\ 'no_split': 1,
	"	\ 'create': 1,
	"	\ 'no_buffer': 0,
	"	\ 'explorer' : 1,
	"	\ 'safe' : 0,
	"	\ 'force_quit' : 1,
	"	\ })

endfunction
augroup FileExplorer
	autocmd!
augroup END
augroup Unite
	"autocmd VimEnter * silent! autocmd! FileExplorer
	autocmd BufEnter,VimEnter * call s:browse_check(expand('<amatch>'))
	"autocmd BufEnter,VimEnter * call s:browse_check(expand('<amatch>'))
augroup END
"
