" code adapted from https://github.com/chase/vim-ansible-yaml
" and https://gist.github.com/iangreenleaf/871107

setlocal autoindent shiftwidth=2 tabstop=2 expandtab
setlocal indentexpr=GetYamlIndent(v:lnum)
setlocal indentkeys=!^Fo,O,0#,<:>,-
setlocal nosmartindent

function! GetYamlIndent(lnum)
	let prevlnum = a:lnum - 1
	if prevlnum == 0
		return 0
	endif
	let prevline = getline(prevlnum)
	let indent = indent(prevlnum)
	let increase = indent + &sw

	if prevline =~ '\%(^\|\s\)#'
		return indent
	elseif prevline =~ ':\s*[>|]?$'
		return increase
	elseif prevline =~ ':$'
		return increase
	elseif prevline =~ '^\s*-\s*$'
		return increase
	elseif prevline =~ '^\s*-\s\+[^:]\+:\s*\S'
		return increase
	else
		return indent
	endif
endfunction


