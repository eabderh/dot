#function cd {
#	builtin cd "$@"
#	tput setaf 8; tput setab 236
#	spwd 2> /dev/null
#	tput sgr0
#}

function cd {
	builtin cd "$@"
	ls
}; #export -f cd

