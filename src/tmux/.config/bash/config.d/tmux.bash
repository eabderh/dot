

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


function tmux_process_tree {
	ps x --ppid $(pgrep --exact 'tmux: server')
}; export -f tmux_process_tree


if [[ "$TMUX" != "" ]]; then
	function tmux_naming {
		local STATUS=''
		STATUS+="$(pwd)"

		local GITBRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
		if [[ "$GITBRANCH" != "" ]]; then
			if [[ "$(git status --porcelain)" != "" ]]; then
				STATUS+=' ◇ '
			else
				STATUS+=' ◆ '
			fi
			STATUS+="$GITBRANCH"
		fi
		#STATUS="────⟨ $STATUS ⟩────"
		#STATUS="━━━━━━━━━━ $STATUS "
		#STATUS="━━━━━━━━━━━━━━━━ $STATUS "
		STATUS=" $STATUS "

		tmux select-pane -T "$STATUS"
		tmux rename-window -t${TMUX_PANE} "$(basename $(spwd))"
	}
	#TMUX_CMDS="tmux select-pane -T \"\$(pwd)\";"
	#TMUX_CMDS+="tmux rename-window -t\${TMUX_PANE} \"\$(basename \$(spwd))\";"
	#export PROMPT_COMMAND="${PROMPT_COMMAND}${TMUX_CMDS}"
	export PROMPT_COMMAND="${PROMPT_COMMAND}tmux_naming;"


	function tmuxfive {
		tmux set-option -g prefix '5'
		tmux bind-key '5' send-prefix
	}; export -f tmuxfive

	function tmuxctrla {
		tmux set-option -g prefix 'C-a'
		tmux bind-key 'C-a' send-prefix
	}; export -f tmuxctrla

fi



# tmuxp
#alias tmload='tmuxp load'

