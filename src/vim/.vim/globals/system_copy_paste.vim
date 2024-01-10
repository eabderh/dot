


"vnoremap <silent><leader>y "yy <Bar> :exec 'call system(''''tmux load-buffer /dev/stdin'''', @y)'<CR>
"vnoremap <silent>        Y "yy <Bar> :exec 'call system("tmux load-buffer /dev/stdin", @y)'<CR>

vnoremap <silent><leader>y "yy <Bar> :call system('tmux load-buffer /dev/stdin', @y)<CR>
vnoremap <silent>        Y "yy <Bar> :call system('tmux load-buffer /dev/stdin', @y)<CR>
"vnoremap <silent><leader>y "yy <Bar> :call system('tmux set-buffer ' . '''' . @y . '''')<CR>
"vnoremap <silent>        Y "yy <Bar> :call system('tmux set-buffer ' . '''' . @y . '''')<CR>

"vnoremap <silent><leader>y "yy <Bar> :echom system('tmux set-buffer', @y)<CR>
"vnoremap <silent>        Y "yy <Bar> :echom system('tmux set-buffer', @y)<CR>

nnoremap <silent><leader>p "=system('tmux show-buffer')<C-M>p
nnoremap <silent>        P "=system('tmux show-buffer')<C-M>p


