
#mkdir -p $HISTROOT
export HISTROOT="${HOME}/dev/domains/bash/history.d"
export HISTFILE="${HISTROOT}/$(tty | sed -e 's;/;;g')"
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE="1000"

export PROMPT_COMMAND="${PROMPT_COMMAND} history -a;"


function history_add() {
	history -a
	history | tail
	while IFS='' read -u10 line; do
		#echo "HISTFILE: $HISTFILE"
		#return 0
		history -s "${line}"
		#history -a
		#cat "$HISTFILE"
	done 10</dev/stdin
	history -r
}; export -f history_add


