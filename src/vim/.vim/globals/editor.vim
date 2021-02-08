

" highlighting
" -----------------------------------------------------------------------------

" turn on highlighting of searches
set hlsearch
" remove all highlightings
nnoremap <silent> 	<leader>a 	:let @/ = ""<CR>




" visual helpers
" -----------------------------------------------------------------------------

" set minimum of lines shown below or above curser before scrolling
set scrolloff=10
" show line numbers
set number
" highlight current line
set cursorline
" always show statusbar
set laststatus=2
" turn off list mode (shows tabs and end-of-lines)
set nolist

" FUCK YEAH! VIMSCRIPT ALL THE WAY!
" PS: this is a hack, I wanted to highlight cursor row until 80 and then
" stop. However, I cant do that, so I had to improvise by setting the...
" I'll have to fix this at some point.
set colorcolumn=80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200




" command mode
" -----------------------------------------------------------------------------

" show options on <TAB> on the command line
set wildmenu
" get rid of latex files 'press enter to continue' messages
set cmdheight=2




" commands
" -----------------------------------------------------------------------------


" run make
nnoremap <silent> 	<leader>b 	:make<CR>


