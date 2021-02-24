
"set runtimepath^=~/.config


" plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" colorscheme plugins
Plug 'morhetz/gruvbox'

" autocomplete
" fucken hell
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" star what is highlighted in visual mode
Plug 'thinca/vim-visualstar'

" file explorer
Plug 'Shougo/unite.vim'
" replace netrw file explorer with unite.vim plugin
Plug 'Shougo/vimfiler.vim'

" golang helper
Plug 'fatih/vim-go'

call plug#end()

"let g:deoplete#enable_at_startup = 1


" load mappings
" -----------------------------------------------------------------------------

source ~/.config/vim/map.vim





" colorscheme
" -----------------------------------------------------------------------------

colorscheme gruvbox
set background=dark




" TEXT
" -----------------------------------------------------------------------------




" TEXT
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
