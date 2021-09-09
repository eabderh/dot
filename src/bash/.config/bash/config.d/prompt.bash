

source $HOME/.config/bash/lib/colors.bash

PROMPT_CWD='$(spwd 2> /dev/null)'
PROMPT_USER='[\u@\h]'
PROMPT_HOST='[\h]'


#WHITE='1;37'
#LIGHTGRAY='1;35'

#PROMPT_STYLE_PREPEND='\[\e['"$WHITE"'m\]'
##PROMPT_STYLE_PREPEND='\[\e[39;49;0m\]'
##PROMPT_STYLE_INFO='\[\e[37;49;1m\]'
##PROMPT_STYLE_SPECIAL='\[\e[37;49;1m\]'
#PROMPT_STYLE_SPECIAL='\[\e['"$WHITE"'m\]'
#
#PROMPT_STYLE_NORMAL='\[\e[0;39;0m\]'
#PROMPT_STYLE_PREPEND='\[\e[0;39;0m\]'
#PROMPT_STYLE_SPECIAL='\[\e[0;39;0m\]'

#PROMPT_STYLE_PREPEND="$(tput setaf 7)"
#PROMPT_STYLE_NORMAL="$(tput setaf 15)"
#PROMPT_STYLE_SPECIAL="$(tput sgr0)"

#PROMPT_PREPEND=$'\u25A2' #
#PROMPT_PREPEND=$'\u2666' # diamond
#PROMPT_PREPEND=$'\u258C' # square
#PROMPT_PREPEND=$'\u25FE' # block
PROMPT_PREPEND='◼'
PROMPT_APPEND='⸬ '
PROMPT_APPEND='⨉ '
PROMPT_APPEND='⑊'
PROMPT_APPEND='☰ '
PROMPT_APPEND='⏥ '
PROMPT_APPEND='◌'
PROMPT_APPEND='᚜'
PROMPT_APPEND='◼'
#PROMPT_PREPEND="\[$(tput setaf 15)\]"$'\u25FE' # ◼
#PROMPT_PREPEND="\[$(tput setaf 15)\]"$'\u25A0' # ■


function exitcodeswitch {
	local PROMPT_EXITCODE="$?"

	if [ $EXITCODE != 0 ]; then
		PS1="$PROMPT"
	else
		PS1="$PROMPT"
		#PS1="$PROMPT_FAIL"
	fi
}

if ! command -v spwd &>/dev/null; then
	function spwd { pwd; }
fi



function dyn_prompt {
	local EXITCODE="$?"
	local PROMPT=''
	#if [[ "$(pwd)" = "$HOME" ]] then
	#fi


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

	PROMPT+="\[$(tput setaf 8)\]"
	PROMPT+=" $PROMPT_APPEND"
	PROMPT+="\[$(tput setaf 7)\]"
	PROMPT+=" "
	#PROMPT+=" \[$(tput sgr0)\]"

	export PS1="$PROMPT"
}

export PROMPT_COMMAND="dyn_prompt;${PROMPT_COMMAND}"


##PROMPT_PREPEND=$' \u25FC' # ◾
###PROMPT_PREPEND="#"
##PROMPT_INFO_SEP='>'
##PROMPT_CMD_PREPEND='$'
###PROMPT_CMD_PREPEND=$'\u25FE' # block
##
##
##
###function prompt_short() {
###	PROMPT=''
###	#PROMPT+="$PROMPT_STYLE_PREPEND"
###	PROMPT+="$PROMPT_PREPEND "
###	PROMPT+="$(tput setaf 15)"
###	export PROMPT="$PROMPT"
###}
##
##function prompt_oneline() {
##	PROMPT=''
##	PROMPT_FAIL=''
##	PROMPT+=""\[$(tput setaf 15)\]"$PROMPT_PREPEND "
##	PROMPT_FAIL+="$PROMPT_PREPEND "
##	if [ -z "$TMUX" ]; then
##		PROMPT+="$PROMPT_HOST "
##	fi
##	PROMPT+="$PROMPT_CWD "
##	PROMPT+="$PROMPT_CMD_PREPEND "
##	PROMPT+="\[$(tput sgr0)\]"
##	export PROMPT="$PROMPT"
##}
##
###function prompt_twoline() {
###	PROMPT=''
###	#PROMPT+='\n'
###	#PROMPT+="$PROMPT_PREPEND "
###	#PROMPT+="$PROMPT_STYLE_INFO"
###	#PROMPT+="$PROMPT_USER $PROMPT_INFO_SEP "
###	PROMPT+="$PROMPT_STYLE_PREPEND"
###	PROMPT+="$PROMPT_PREPEND "
###	PROMPT+="$PROMPT_STYLE_NORMAL"
###	PROMPT+="$PROMPT_USER "
###	PROMPT+="$PROMPT_STYLE_SPECIAL"
###	PROMPT+="$PROMPT_CWD \n"
###	PROMPT+="$PROMPT_STYLE_PREPEND"
###	PROMPT+="$PROMPT_PREPEND "
###	PROMPT+="$PROMPT_STYLE_SPECIAL"
###	PROMPT+="$PROMPT_CMD_PREPEND "
###	PROMPT+="$PROMPT_STYLE_NORMAL"
###	export PS1="$PROMPT"
###}
##
##prompt_oneline
##
##
