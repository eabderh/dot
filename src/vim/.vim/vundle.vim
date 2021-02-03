
" vundle
" -----------------------------------------------------------------------------

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
filetype off

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
	" installs and updates plugins



" application plugins

" autocomplete
Plugin 'ervandew/supertab'
" star what is highlighted in visual mode
Plugin 'thinca/vim-visualstar'
" local vimrc files
Plugin 'embear/vim-localvimrc'
" fix buffer ordering
Plugin 'ton/vim-bufsurf'
" line at bottom showing open buffers
Plugin 'bling/vim-bufferline'



" file explorer plugins

" file explorer
Plugin 'Shougo/unite.vim'
" replace netrw file explorer with unite.vim plugin
Plugin 'Shougo/vimfiler.vim'



" colorscheme plugins

Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'



" filetype plugins

" golang helper
Plugin 'fatih/vim-go'
" jade (pug) vim filetype
Plugin 'digitaltoad/vim-pug'
" css filetype
Plugin 'hail2u/vim-css3-syntax.git'
" sass filetype
Plugin 'cakebaker/scss-syntax.vim'
" ejs filetype
Plugin 'nikvdp/ejs-syntax'
" vue filetype
Plugin 'posva/vim-vue'




call vundle#end()
filetype plugin indent on




" unused plugins
" -----------------------------------------------------------------------------



" coffeescript filetype
"Plugin 'kchmck/vim-coffee-script'
" shows whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" git wrapper
"Plugin 'tpope/vim-fugitive'
" alignment
"Plugin 'junegunn/vim-easy-align'
" bufexplorer
"Plugin 'jlanzarotta/bufexplorer'
" makes and maintains sessions
"Plugin 'tpope/vim-obsession'
" add prompt to vimfiler
"Plugin 'romgrk/vimfiler-prompt'
" software capslock
"Plugin 'tpope/vim-capslock'



" not quite working...

" status bar
"Plugin 'bling/vim-airline'
" motion help
"Plugin 'Lokaltog/vim-easymotion'



" possible plugins

"Plugin 'notpratheek/vim-luna'
"Plugin 'kien/ctrlp.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-scripts/EasyGrep'
"Plugin 'vim-scripts/buftabs'



" -----------------------------------------------------------------------------
