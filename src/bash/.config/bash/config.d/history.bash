
#mkdir -p $HISTROOT
export HISTROOT="$HOME/dev/domains/bash/history.d"
export HISTFILE="$HISTROOT/$(tty | sed -e 's;/;;g')"
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE="1000"


if [[ "$PROMPT_COMMAND_HISTORY" = "" ]]; then
	export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
	export PROMPT_COMMAND_HISTORY="true"
fi
