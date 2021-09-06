

alias dot-tmux='tmux source-file ~/.tmux.conf'
alias tm='tmux -2 -u'
function tma() {
	if [ -z "$1" ]; then
		tmux attach
	else
		tmux attach-session -t $1
	fi
}
export -f tma
alias tmo='tmux attach-session #'
alias tms='tmux new -s'
alias tmls='tmux list-sessions'


if [[ "$TMUX" != "" ]]; then
	TMUX_CMDS="tmux select-pane -T \"\$(pwd)\";"
	TMUX_CMDS+="tmux rename-window -t\${TMUX_PANE} \"\$(basename \$(spwd))\";"
	export PROMPT_COMMAND="${TMUX_CMDS}${PROMPT_COMMAND}"
fi


# tmuxp
#alias tmload='tmuxp load'

