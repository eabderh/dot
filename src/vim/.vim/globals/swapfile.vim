



set noswapfile


" https://vim.fandom.com/wiki/Diff_current_buffer_and_the_original_file
function! s:OpenOriginalFile()
  let filetype=&ft
  enew | read # | normal! 0d_
  exe "setlocal buftype=nofile noswapfile readonly ft=" . filetype
  "exe "setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile readonly ft=" . filetype
endfunction
com! OpenOriginalFile call s:OpenOriginalFile()


