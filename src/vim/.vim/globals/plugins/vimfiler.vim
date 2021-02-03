
" replace netrw file explorer with unite.vim plugin
"Plugin 'Shougo/vimfiler.vim'

" replace netrw
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
	\ 'explorer' : 1,
	\ 'safe' : 0,
	\ 'force_quit' : 1,
	\ })

" when opening the vimfiler 'buffer', use these settings
autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
	nmap <buffer> i <Plug>(vimfiler_set_current_mask)
	nmap <buffer> q <Plug>(vimfiler_exit)
	nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction





