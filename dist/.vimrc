"[*] file header
"project: vimrc
"file: .vimrc
"author: elias abderhalden
"date: 2014-11-02


"[*] initial stuff
let mapleader='m'


"[*] sources
"source scripts.vim
source ~/.vim/vimrc_ext.vim


"[*] plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
	" installs and updates plugins

" application plugins
Plugin 'ervandew/supertab'
	" autocomplete
Plugin 'thinca/vim-visualstar'
	" star what is highlighted in visual mode
Plugin 'tpope/vim-capslock'
	" software capslock
Plugin 'embear/vim-localvimrc'
	" local vimrc files
Plugin 'ton/vim-bufsurf'
	" fix buffer ordering
Plugin 'bling/vim-bufferline'
	" line at bottom showing open buffers

" file explorer plugins
Plugin 'Shougo/unite.vim'
	" file explorer
Plugin 'Shougo/vimfiler.vim'
	" replace netrw file explorer with unite.vim plugin

" colorscheme plugins
Plugin 'morhetz/gruvbox'
	" color theme
Plugin 'tomasr/molokai'
	" color theme

" filetype plugins
Plugin 'digitaltoad/vim-pug'
	" jade (pug) vim filetype
Plugin 'hail2u/vim-css3-syntax.git'
	" css filetype
Plugin 'cakebaker/scss-syntax.vim'
	" sass filetype
Plugin 'kchmck/vim-coffee-script'
	" coffeescript filetype
Plugin 'nikvdp/ejs-syntax'
	" ejs filetype
Plugin 'fatih/vim-go'
	" golang helper
Plugin 'posva/vim-vue'
	" vue filetype

" unused plugins
"Plugin 'ntpeters/vim-better-whitespace'
	" shows whitespace
"Plugin 'tpope/vim-fugitive'
	" git wrapper
"Plugin 'junegunn/vim-easy-align'
	" alignment
"Plugin 'jlanzarotta/bufexplorer'
	" bufexplorer
"Plugin 'tpope/vim-obsession'
	" makes and maintains sessions
"Plugin 'romgrk/vimfiler-prompt'
	" add prompt to vimfiler

" not quite working...
"Plugin 'bling/vim-airline'
"Plugin 'Lokaltog/vim-easymotion'
	" motion help

" possible plugins
"Plugin 'notpratheek/vim-luna'
"Plugin 'kien/ctrlp.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-scripts/EasyGrep'
"Plugin 'vim-scripts/buftabs'
call vundle#end()
filetype plugin indent on


"[*.*] plugin settings


"[*.*.*] molokai
let g:rehash256 = 1


"[*.*.*] supertab
let g:SuperTabNoCompleteAfter = [ '^', '\s', '"',
								\ '(', ')',
								\ '{', '}',
								\ '\\', '/']


"[*.*.*] supertab
"let g:airline_powerline_fonts = 0
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"


"[*.*.*] vim-better-whitespace
highlight ExtraWhitespace ctermbg=236
highlight ExtraWhitespace ctermfg=239
let g:current_line_whitespace_disabled_soft = 1
nnoremap <silent> <leader>x :ToggleWhitespace<CR>


"[*.*.*] easymotion
"let g:EasyMotion_do_mapping = 0
"nmap <leader>q <Plug>(easymotion-sn)
"nmap n <Plug>(easymotion-next)
"nmap N <Plug>(easymotion-prev)


"[*.*.*] indent guides
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234



"[*.*.*] vim-easy-align
"vnoremap mi <Plug>(EasyAlign)
"xmap <leader>i <Plug>(EasyAlign)
"let g:easy_align_delimiters = {
"\  ' ': { 'pattern': ' ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
"\  '=': { 'pattern': '===\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.?-]\?=[#?]\?',
"\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
"\  ':': { 'pattern': ':',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
"\  ',': { 'pattern': ',',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
"\  '|': { 'pattern': '|',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
"\  '.': { 'pattern': '\.', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
"\  '#': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
"\  '"': { 'pattern': '"\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
"\  '&': { 'pattern': '\\\@<!&\|\\\\',
"\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
"\  '{': { 'pattern': '(\@<!{',
"\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
"\  '}': { 'pattern': '}',  'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
"\ }

"[*.*.*] vim-capslock
imap <silent> <C-c> <Plug>CapsLockToggle
nmap <silent> <leader>c <Plug>CapsLockToggle


"[*.*.*] bufsurf
"nnoremap <silent> <leader>f :BufSurfForward<CR>
"nnoremap <silent> <leader>s :BufSurfBack<CR>


"[*.*.*] local vimrc files - vim-localvimrc
let g:localvimrc_name = [ '.lvimrc', '.local.vimrc' ]
let g:localvimrc_ask = 0


"[*.*.*] vim file explorer (unite.vim , vimfiler.vim)
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
	\ 'explorer' : 1,
	\ 'safe' : 0,
	\ 'force_quit' : 1,
	\ })
autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
	nmap <buffer> i <Plug>(vimfiler_set_current_mask)
	nmap <buffer> q <Plug>(vimfiler_exit)
	nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction


"[*] colorscheme
filetype plugin on
syntax on
"colorscheme mustang
"colorscheme twilight256
"colorscheme badwolf
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme luna-term
"colorscheme molokai_ea
colorscheme gruvbox
set background=dark



" FUCK YEAH! VIMSCRIPT ALL THE WAY!
" PS: this is a hack, I wanted to hightlight cursor row until 80 and then
" stop. However, I cant do that, so I had to improvise by setting the...
" I'll have to fix this at some point.
set colorcolumn=80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200
hi ColorColumn ctermbg=235



"set linebreak


"[*] local mappings
inoremap jk <Esc>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :xa<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>t :bd<CR>
nnoremap <silent> <leader>e :e<CR>
"nnoremap  :
" paragraph maker
nnoremap <silent> <leader>p gqgq
nnoremap <silent> <leader>P gqap
"inoremap <silent> <C-p> <Esc>pi


"[*.*] completion mappings
"iabbrev </ </<C-X><C-O>


"[*.*] movement mappings
"nnoremap io
source ~/.vim/vimrc_map.vim
nnoremap o $a
nnoremap <silent> <Space> :call Movemap_toggle()<CR>
vnoremap <silent> <Space> :call Movemap_toggle()<CR>
call Movemap_mov()
"set whichwrap+=<,>,h,l,[,]
"set scrolloff=999
set scrolloff=10


"[*.*] buffer mappings
nnoremap <silent> <leader>f :<C-u>SmartSave<CR>:bnext<CR>
nnoremap <silent> <leader>s :<C-u>SmartSave<CR>:bprevious<CR>
nnoremap <silent> . :<C-u>SmartSave<CR>:bnext<CR>
nnoremap <silent> , :<C-u>SmartSave<CR>:bprevious<CR>
nnoremap <silent> <leader>F :bnext<CR>
nnoremap <silent> <leader>S :bprevious<CR>
nnoremap <silent> <leader>m :b#<CR>
nnoremap <leader>i :b
nnoremap <leader>dd :bd<CR>
"nnoremap <Space> z.
"map z z.


"[*.*] keyboard remappings (for c)
"inoremap [ {
"inoremap ] }
"inoremap { [
"inoremap } ]


"[*.*] editing mappings
nnoremap t dd
nnoremap y yy


"[*.*] folding mappings
nnoremap zz zA
nnoremap zm zM
nnoremap zr zR


"[*.*] windows mapping
"nnoremap <leader>d <C-w>j
"nnoremap <leader>e <C-w>k
"nnoremap <silent> ww :call Togglewindow()<CR>
nnoremap w; :split<CR>
nnoremap w' :vsplit<CR>
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wh <C-w>h
nnoremap wl <C-w>l
nnoremap we :only<CR>


"[*.*] command mappings (save)
command -nargs=0 -bar SmartSave if &modified
	\|	if empty(bufname('%'))
	\|		browse confirm write
	\|	else
	\|		confirm write
	\|	endif
	\|endif

"inoremap <silent> jw <Esc>:<C-u>SmartSave<CR>i
"inoremap <silent> jx <Esc>:x<CR>
nnoremap ;; :
nnoremap <silent> ;w :<C-u>SmartSave<CR>
nnoremap <silent> ;x :x<CR>
nnoremap <silent> ;dd :w<CR>:bd<CR>
nnoremap <silent> ;q :q!<CR>


"[*.*] command mappings
"cnoremap a<CR> Unite file buffer<CR>
nnoremap <leader>u :Unite file buffer<CR>


"[*.*] other
nnoremap <silent> <leader>a :let @/ = ""<CR>
nnoremap <silent> <leader>X :call Togglestar()<CR>
"nnoremap <leader>ig
nnoremap <F7> :set list<CR>
nnoremap <F8> :set nolist<CR>
"time and date insert
nnoremap <F5> "=strftime("[%F %T %z %s]")<CR>P
inoremap <F5> <C-R>=strftime("[%F %T %z %s]")<CR>


"[*.*] build
nnoremap <silent> <leader>b :make<CR>




"[*.*] testing
"inoremap 8 *

"[*] settings
set number
set cursorline
set wildmenu
"set showcmd
set laststatus=2
set nolist
"set wrapmargin=10


"set textwidth=80

"highlight OverLength ctermbg=230 ctermfg=218
"match OverLength /\%>21v.*/

"set wrap
"set showbreak=/







"set numberwidth=6
"set columns=80
"match ErrorMsg '\%>80v.\+'
"set textwidth=80

"let w:eighty_column_match = matchadd('ColorColumn', '\%81v.\+', 100)
"set columns=80
"autocmd VimResized * if (&columns > 80) | set columns=80 | endif
"set wrap
"set linebreak




"[*.*] syntax

"mode:
"	func()
"	{
"		if ()
"		 	{
"		 	abc;
"		 	}
"	}
"set cinkeys=0{,0},:,0#,!^F,o,O,e
"set cinoptions={1s

"mode:
"	func()
"	{
"	if () {
"		abc;
"		}
"	}
"set cinkeys=0{,*0},:,0#,!^F,o,O,e
"set cinoptions={1s,^-8

"mode:
"	func() {
"	if () {
"		abc;
"	}
"	}
set cinkeys=0{,0},:,0#,!^F,o,O,e
set cinoptions={1s,^-8


"[*.*] searching
set hlsearch

"[*.*] keyword
set iskeyword+=-



"[*.*] tab settings
set noexpandtab
set nosmarttab
set tabstop=4
set softtabstop=0
set shiftwidth=4


"[*.*] folding
set nofoldenable
set foldmethod=syntax
set foldlevel=4
autocmd FileType c setlocal foldmethod=syntax

"[*.*] get rid of latex files 'press enter to continue' messages
set cmdheight=2


"[*.*] netrw
"let g:netrw_banner=0


