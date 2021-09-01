

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
	if [[ "$PROMPT_COMMAND_TMUX" = "" ]]; then
		export PROMPT_COMMAND="tmux select-pane -T \$(pwd); $PROMPT_COMMAND"
		export PROMPT_COMMAND_TMUX="true"
	fi
fi


# tmuxp
#alias tmload='tmuxp load'

