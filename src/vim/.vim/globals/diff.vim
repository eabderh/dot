
function VimDiff()
	" diff all buffers
	execute 'bufdo diffthis'
	" window all vertically
	execute 'vertical sball'
endfunction

function VimDiffOff()
	" turn off diff for all buffers
	execute 'bufdo diffoff'
	" return to only one window
	execute 'only'
endfunction

let s:VimDiffEnabled = 0

function! VimDiffToggle()
    if s:VimDiffEnabled
        call VimDiffOff()
        let s:VimDiffEnabled = 0
    else
        call VimDiff()
        let s:VimDiffEnabled = 1
    endif
endfunction

command! Diff call VimDiff()
command! DiffOff call VimDiffOff()
command! DiffToggle call VimDiffToggle()

nnoremap <silent>    <leader>D              :call VimDiffToggle()<CR>

