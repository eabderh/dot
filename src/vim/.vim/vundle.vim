
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
" the one, the only
Plugin 'preservim/nerdtree'
" lets try
"Plugin 'lambdalisue/fern.vim'




" colorscheme plugins

Plugin 'morhetz/gruvbox'
"Plugin 'tomasr/molokai'
"Plugin 'chriskempson/base16-vim'



" filetype plugins

" golang helper
Plugin 'fatih/vim-go'
" pug vim filetype
Plugin 'digitaltoad/vim-pug'
" css filetype
Plugin 'hail2u/vim-css3-syntax.git'
" sass filetype
Plugin 'cakebaker/scss-syntax.vim'
" vue filetype
Plugin 'posva/vim-vue'
" ejs filetype
"Plugin 'nikvdp/ejs-syntax'
" hcl filetype
Plugin 'jvirtanen/vim-hcl'
" dockerfile filetype
Plugin 'ekalinin/Dockerfile.vim'
" cisco filetype
Plugin 'momota/cisco.vim'
" cue filetype
Plugin 'jjo/vim-cue'
" jenkinsfile filetype
Plugin 'martinda/Jenkinsfile-vim-syntax'
" typescript filetype
Plugin 'leafgarland/typescript-vim.git'
" java auto import
Plugin 'rustushki/JavaImp.vim'



" git plugins
Plugin 'airblade/vim-gitgutter'

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
