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
Plugin 'tpope/vim-obsession'
	" makes and maintains sessions
Plugin 'ervandew/supertab'
	" autocomplete
Plugin 'Shougo/unite.vim'
	" find files
Plugin 'tomasr/molokai'
	" color theme
Plugin 'bling/vim-bufferline'
	" line at bottom showing open buffers
Plugin 'ntpeters/vim-better-whitespace'
	" shows whitespace
Plugin 'tpope/vim-fugitive'
	" git wrapper
Plugin 'junegunn/vim-easy-align'
	" alignment
Plugin 'digitaltoad/vim-pug'
	" jade (pug) vim filetype
Plugin 'hail2u/vim-css3-syntax.git'
	" css filetype
Plugin 'cakebaker/scss-syntax.vim'
	" sass filetype
Plugin 'kchmck/vim-coffee-script'
	" coffeescript filetype
Plugin 'tpope/vim-capslock'
	" software capslock
Plugin 'ton/vim-bufsurf'
	" fix buffer ordering
Plugin 'nikvdp/ejs-syntax'
	" ejs filetype
Plugin 'embear/vim-localvimrc'
	" local vimrc files
Plugin 'thinca/vim-visualstar'
	" star what is in visual

"Plugin 'jlanzarotta/bufexplorer'
	" bufexplorer


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
autocmd VimEnter,Colorscheme * :hi ExtraWhitespace ctermbg=236
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
xmap <leader>i <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\  ' ': { 'pattern': ' ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '=': { 'pattern': '===\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.?-]\?=[#?]\?',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ':': { 'pattern': ':',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ',': { 'pattern': ',',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
\  '|': { 'pattern': '|',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '.': { 'pattern': '\.', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '#': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\  '"': { 'pattern': '"\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\  '&': { 'pattern': '\\\@<!&\|\\\\',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '{': { 'pattern': '(\@<!{',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '}': { 'pattern': '}',  'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
\ }

"[*.*.*] vim-capslock
imap <silent> <C-c> <Plug>CapsLockToggle
nmap <silent> <leader>c <Plug>CapsLockToggle

"[*.*.*] bufsurf
"nnoremap <silent> <leader>f :BufSurfForward<CR>
"nnoremap <silent> <leader>s :BufSurfBack<CR>

"[*.*.*] local vimrc files - vim-localvimrc
let g:localvimrc_name = [ '.lvimrc', '.local.vimrc' ]
let g:localvimrc_ask = 0

"[*] colorscheme
syntax on
"colorscheme mustang
"colorscheme twilight256
"colorscheme badwolf
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme luna-term
colorscheme molokai_ea


"[*] local mappings
inoremap jk <Esc>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :xa<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>t :bd<CR>
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
nnoremap <leader>d <C-w>j
nnoremap <leader>e <C-w>k
"nnoremap <silent> ww :call Togglewindow()<CR>
nnoremap w; :split<CR>
nnoremap w' :vsplit<CR>
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wh <C-w>h
nnoremap wl <C-w>l
nnoremap we :only<CR>


"[*.*] saving mappings (save)
command -nargs=0 -bar SmartSave if &modified
	\|	if empty(bufname('%'))
	\|		browse confirm write
	\|	else
	\|		confirm write
	\|	endif
	\|endif

"inoremap <silent> jw <Esc>:<C-u>SmartSave<CR>i
"inoremap <silent> jx <Esc>:x<CR>
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





"FUCK YEAH! VIMSCRIPT ALL THE WAY!
set colorcolumn=80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200



hi ColorColumn ctermbg=234
"set linebreak


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


"[*.*] Path

"Python
set path+=~/dev/python/lib
highlight NormalBold ctermfg=254 ctermbg=234 cterm=bold




