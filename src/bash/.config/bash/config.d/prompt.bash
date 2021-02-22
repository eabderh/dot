

source $HOME/.config/bash/lib/colors.bash

PROMPT_CWD='$(spwd 2> /dev/null)'
PROMPT_USER='[\u@\h]'
PROMPT_HOST='[\h]'



PROMPT_STYLE_PREPEND='\[\e['"$WHITE"'m\]'
#PROMPT_STYLE_PREPEND='\[\e[39;49;0m\]'
#PROMPT_STYLE_INFO='\[\e[37;49;1m\]'
#PROMPT_STYLE_SPECIAL='\[\e[37;49;1m\]'
PROMPT_STYLE_SPECIAL='\[\e['"$WHITE"'m\]'
PROMPT_STYLE_NORMAL='\[\e[0;39;0m\]'

PROMPT_PREPEND=$'\u2666'
PROMPT_PREPEND=$'\u258C'
#PROMPT_PREPEND="#"
PROMPT_INFO_SEP='>'
PROMPT_CMD_PREPEND='$'

#export PSD=0
#
#PROMPT_INFO=()
#PROMPT_INFO[0]="$PROMPT_STYLE_INFO$PROMPT_PREPEND"
#PROMPT_INFO[1]="$PROMPT_CWD"


function oneline() {
	PROMPT=''
	PROMPT+="$PROMPT_STYLE_PREPEND"
	PROMPT+="$PROMPT_PREPEND "
	if [ -z "$TMUX" ]; then
		PROMPT+="$PROMPT_HOST "
	fi
	PROMPT+="$PROMPT_STYLE_SPECIAL"
	PROMPT+="$PROMPT_CWD "
	PROMPT+="$PROMPT_CMD_PREPEND "
	PROMPT+="$PROMPT_STYLE_NORMAL"
	export PS1="$PROMPT"
}

function twoline() {
	PROMPT=''
	#PROMPT+='\n'
	#PROMPT+="$PROMPT_PREPEND "
	#PROMPT+="$PROMPT_STYLE_INFO"
	#PROMPT+="$PROMPT_USER $PROMPT_INFO_SEP "
	PROMPT+="$PROMPT_STYLE_PREPEND"
	PROMPT+="$PROMPT_PREPEND "
	PROMPT+="$PROMPT_STYLE_NORMAL"
	PROMPT+="$PROMPT_USER "
	PROMPT+="$PROMPT_STYLE_SPECIAL"
	PROMPT+="$PROMPT_CWD \n"
	PROMPT+="$PROMPT_STYLE_PREPEND"
	PROMPT+="$PROMPT_PREPEND "
	PROMPT+="$PROMPT_STYLE_SPECIAL"
	PROMPT+="$PROMPT_CMD_PREPEND "
	PROMPT+="$PROMPT_STYLE_NORMAL"
	export PS1="$PROMPT"
}

oneline

#PROMPT=''
##PROMPT+='\n'
##PROMPT+="$PROMPT_PREPEND "
##PROMPT+="$PROMPT_STYLE_INFO"
##PROMPT+="$PROMPT_USER $PROMPT_INFO_SEP "
#PROMPT+="$PROMPT_STYLE_PREPEND"
#PROMPT+="$PROMPT_PREPEND "
#PROMPT+="$PROMPT_STYLE_NORMAL"
#PROMPT+="$PROMPT_USER "
#PROMPT+="$PROMPT_STYLE_SPECIAL"
#PROMPT+="$PROMPT_CWD \n"
#PROMPT+="$PROMPT_STYLE_PREPEND"
#PROMPT+="$PROMPT_PREPEND "
#PROMPT+="$PROMPT_STYLE_SPECIAL"
#PROMPT+="$PROMPT_CMD_PREPEND "
#PROMPT+="$PROMPT_STYLE_NORMAL"
#export PS1="$PROMPT"

#export PS1="\[[\e[01;04;38m\]\u@\h\e[00;01m\]] \$(python ~/.pwd.py 2> /dev/null) \$ \[\e[0;0m\]"



