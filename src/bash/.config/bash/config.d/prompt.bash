
function exitcodeswitch {
	local PROMPT_EXITCODE="$?"

	if [ $EXITCODE != 0 ]; then
		PS1="$PROMPT"
	else
		PS1="$PROMPT"
		#PS1="$PROMPT_FAIL"
	fi
}


unset spwd
#if ! command -v spwd &>/dev/null; then
#	function spwd { pwd; }
#fi



function simple_prompt {

	local EXITCODE="$?"
	local PROMPT=''
	#if [[ "$(pwd)" = "$HOME" ]] then
	#fi

	local PROMPT_PREPEND='◼'
	local PROMPT_APPEND='⨉ '
	local PROMPT_APPEND='⑊'
	local PROMPT_APPEND='⏥ '
	local PROMPT_APPEND='◌'
	local PROMPT_APPEND='᚜'
	local PROMPT_APPEND='◼'
	local PROMPT_APPEND='⸬ '
	local PROMPT_APPEND='□'
	local PROMPT_APPEND='☰ '
	local PROMPT_APPEND='○'

	if [[ $EXITCODE != 0 ]]; then
		PROMPT+="\[$(tput setaf 3)\]"
		PROMPT+=" $PROMPT_PREPEND"
	else
		PROMPT+="\[$(tput setaf 7)\]"
		PROMPT+=" $PROMPT_PREPEND"
	fi


	PROMPT+="\[$(tput setaf 8)\]"
	#PROMPT+=' \u@\h'
	#PROMPT+=":"
	PROMPT+=" $(spwd 2> /dev/null)"

	#PROMPT+="\[$(tput setaf 7)\]"
	PROMPT+=" $PROMPT_APPEND "
	#PROMPT+="\[$(tput setaf 7)\]"
	PROMPT+="\[$(tput sgr0)\]"

	export PS1="$PROMPT"
}

function block_prompt {

	local EXITCODE="$?"
	local PROMPT=''

	#local PROMPT_PREPEND='>'
	#local PROMPT_PREPEND='◼'
	local PROMPT_PREPEND='  '

	#PROMPT+="\[$(tput setaf 8)$(tput setab 237)\]"
	if [[ $EXITCODE = 0 ]]; then
		PROMPT+="\[$(tput setaf 8)$(tput setab 238)\]"
		#PROMPT+="\[$(tput setaf 8)\]"
		PROMPT+="$PROMPT_PREPEND"
	else
		PROMPT+="\[$(tput setaf 8)$(tput setab 8)\]"
		#PROMPT+="\[$(tput setaf 3)\]"
		PROMPT+="$PROMPT_PREPEND"
	fi


	#if [[ "$USER" != "taaabel2" ]]; then
	#	PROMPT+="\[$(tput setaf 8)$(tput setab 237)\]"
	#	PROMPT+="$USER "
	#	PROMPT+="\[$(tput sgr0)\]"
	#fi

	local pwd="$( pwd | sed "s:$HOME:\~:" )"

	function padstrip {
		echo "$1" \
			| tail -c $2 \
			| xargs printf "%${2}s"
	}

	if [[ "$(pwd)" != "$HOME" ]]; then
		PROMPT+="\[$(tput setaf 234)$(tput setab 236)\]"
		PROMPT+="▌"
		PROMPT+="\[$(tput setaf 8)$(tput setab 236)\]"

		# # cool effect:
		# replacement=''
		# replacement+="\\\[$(tput setaf 234)$(tput setab 236)\\\]"
		# replacement+=" ▌"
		# replacement+="\\\[$(tput setaf 8)$(tput setab 236)\\\]"
		# PROMPT+=" $(spwd 16 | sed -e "s:/:${replacement}:g")"

		local pwd="$( padstrip "$pwd" 16 )"
		PROMPT+=" ${pwd} "

	else
		length=9
		PROMPT+="\[$(tput setaf 234)$(tput setab 236)\]"
		PROMPT+="▌"
		PROMPT+="\[$(tput setaf 8)$(tput setab 236)\]"
		username="$( echo "$USER" \
			| head -c $length \
			| xargs printf "%-${length}s")"
		PROMPT+=" ${username} "
		PROMPT+="\[$(tput setaf 234)$(tput setab 236)\]"
		PROMPT+="▌"
		PROMPT+="\[$(tput setaf 8)$(tput setab 236)\]"

		local pwd="$( padstrip "$pwd" 4 )"
		PROMPT+=" ${pwd} "
	fi

	PROMPT+="\[$(tput sgr0)\] "


	export PS1="$PROMPT"
}

export PROMPT_COMMAND="block_prompt;${PROMPT_COMMAND}"
#export PROMPT_COMMAND="simple_prompt;${PROMPT_COMMAND}"

