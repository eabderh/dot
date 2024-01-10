

# -----------------------------------------------------------------------------
function ssh_readconfig {
	option=$1
	shift
	args="$@"
	debugtext="$(ssh -G $args 2>&1)"
	ssh -G $args 2>&1 \
		| sed -n 's:^setenv '"${option}"'=\(.*\)$:\1:p' \
		#| grep "^setenv ${option}" \
		#| sed "s:^setenv ${option}=::g"
} ; export -f ssh_readconfig

# -----------------------------------------------------------------------------

function sshpassx {
	args="$@"
	cmd="$(ssh_readconfig 'XPasswordCommand' "$args")"
	prompt="$(ssh_readconfig 'XPasswordPrompt' "$args")"
	echo "sshpassx: XPasswordCommand: ${cmd}" 1>&2
	echo "sshpassx: XPasswordPrompt: ${prompt}" 1>&2

	if [ "$cmd" == "" ]; then
		ssh $args
		return $?
	fi

	pw="$(eval $cmd)"
	#pw="-p'${pw}'"
	if [ "$prompt" != "" ]; then
		prompt="-P ${prompt}"
	fi

	eval /usr/bin/sshpass -v -d3 ssh "$@" 3< <(eval "$cmd";)

} ; export -f sshpassx
function sshpass {
	sshpassx "$@"
}

function scppass {
	args="$@"
	hostname="$(echo "$1" | sed -e 's/:.*$//g')"
	cmd="$(ssh_readconfig 'XPasswordCommand' "$hostname")"
	prompt="$(ssh_readconfig 'XPasswordPrompt' "$hostname")"
	echo "sshpass: XPasswordCommand: ${cmd}" 1>&2
	echo "sshpass: XPasswordPrompt: ${prompt}" 1>&2

	if [ "$cmd" == "" ]; then
		scp $args
		return $?
	fi

	pw="$(eval $cmd)"
	#pw="-p'${pw}'"
	if [ "$prompt" != "" ]; then
		prompt="-P ${prompt}"
	fi

	eval /usr/bin/sshpass -v -d3 scp "$@" 3< <(eval "$cmd";)

} ; export -f scppass

# -----------------------------------------------------------------------------


source /usr/share/bash-completion/completions/ssh

shopt -u hostcomplete && complete -F _ssh sshpass

# -----------------------------------------------------------------------------


#function ssh_readconfig {
#	option=$1
#	shift
#	args="$@"
#	option_lower="$(echo $option | tr '[:upper:]' '[:lower:]')"
#	debugtext="$(ssh -v -G "$args" 2>&1)"
#	regex_error="Ignored unknown option \"${option_lower}\""
#	regex_file='^debug1: \(.*\) line \([[:digit:]]\+\): '
#
#	fileline="$(
#		echo "$debugtext" \
#			| sed -n 's/'"${regex_file}${regex_error}"'/\1:\2/p' \
#			| sed 's/\r//'
#	)"
#	if [ "$fileline" == "" ]; then
#		echo "test" >&2
#		return 0
#	fi
#
#	file="$(echo "$fileline" | cut -d':' -f1)"
#	line="$(echo "$fileline" | cut -d':' -f2)"
#
#	cmd="$( sed -n "${line}p" "$file" | sed -e 's:\s*'"${option}"'\s*::' )"
#	echo "$cmd"
#}
#
#
#function sshpass {
#	args="$@"
#	cmd="$(ssh_readconfig 'XPasswordCommand' "$args")"
#	prompt="$(ssh_readconfig 'XPasswordPrompt' "$args")"
#	pw="$(eval $cmd)"
#	echo $cmd
#	echo $prompt
#	#/usr/bin/sshpass -p"$pw" -P "$prompt" ssh "$@"
#} ; export -f sshpass
#
#
#source /usr/share/bash-completion/completions/ssh
#
#shopt -u hostcomplete && complete -F _ssh sshpass
