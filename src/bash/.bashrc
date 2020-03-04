

# added in case of other bashrc
#if [ -f /etc/bashrc ]; then
#	source /etc/bashrc
#fi
#echo "BASH_PROFILE $-"

# https://unix.stackexchange.com/questions/70486/transferring-files-ssh-scp-error-message-stdin-is-not-a-tty
case $- in
	*i*) ;;
	*) return;;
esac

#echo "ELIAS: INTERACTIVE SHELL, $(tty)"

# TEST ------------------------------------------------------------------------

alias aptly='shim-aptly.sh'
alias dateISO='date +%F'


# SOURCING --------------------------------------------------------------------

source /etc/bash_completion


# COLORS ----------------------------------------------------------------------

XCOLOR_0="0;30"
XCOLOR_1="0;31"
XCOLOR_2="0;32"
XCOLOR_3="0;33"
XCOLOR_4="0;34"
XCOLOR_5="0;35"
XCOLOR_6="0;36"
XCOLOR_7="0;37"
              
XCOLOR_8="1;30"
XCOLOR_9="1;31"
XCOLOR_A="1;32"
XCOLOR_B="1;33"
XCOLOR_C="1;34"
XCOLOR_D="1;35"
XCOLOR_E="1;36"
XCOLOR_F="1;37"

BLACK=$XCOLOR_0
RED=$XCOLOR_1
GREEN=$XCOLOR_2
YELLOW=$XCOLOR_3
BLUE=$XCOLOR_4
MAGENTA=$XCOLOR_5
CYAN=$XCOLOR_6
GREY=$XCOLOR_7

HI_GREY=$XCOLOR_8
HI_RED=$XCOLOR_9
HI_GREEN=$XCOLOR_A
HI_YELLOW=$XCOLOR_B
HI_BLUE=$XCOLOR_C
HI_MAGENTA=$XCOLOR_D
HI_CYAN=$XCOLOR_E
WHITE=$XCOLOR_F


# SYSTEM ----------------------------------------------------------------------

function pushpath() {
	case ":$PATH:" in
		*":$1:"* 	) :;; # already in path
		* 			) export PATH="$PATH:$1";;
	esac
}

# os
pushpath /usr/local/bin
pushpath ~/.local/bin
export SHELL=/bin/bash

# editor
export EDITOR=vim;
export VISUAL=vim;

# encoding
export LC_CTYPE=C
#export LANG=C
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# command line
shopt -s globstar
shopt -s histverify
#export TERM=xterm-256color
#export TERM=screen-256color-s
export TERM=screen-256color
#export TERM=screen-16color

PROMPT_CWD='$(pwd.sh 2> /dev/null)'
#PROMPT_CWD='$(python ~/.pwd.py 2> /dev/null)'
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

# history
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE="1000"
export PROMPT_COMMAND="history -a"
#export PROMPT_COMMAND="history -a; history -c; history -r;"
ttyname=$(tty | sed -e 's;/;;g')
file="${HOME}/.history.d/$ttyname"
mkdir -p $(dirname $file) \
	|| echo 'could not create directory path for history files'
	#&& touch $file \
export HISTFILE=$file

# less
export LESS='-R'


# ssh
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#eval $(ssh-agent -s) > /dev/null

# gnupg (gpg)

TTY=$(tty)
TTY_owner=$(stat --format "%U" $TTY)
if [ ! $TTY_owner = $USER ]; then
	sudo chown $USER:$USER $TTY
fi
export GPG_TTY="$TTY"
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye

# python
export PYTHONPATH=$HOME/dev/python/lib
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# golang
export GOROOT=/usr/local/go
pushpath $GOROOT/bin
export GOPATH=$HOME/dev/go
pushpath $GOPATH/bin
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
pushpath $GOPATH/bin
export GO111MODULE=off
export GOPRIVATE=bytekite.io/x/*

# node / nodejs
NODEJSROOT=/usr/local/node
pushpath $NODEJSROOT/bin
export NODE_PATH="$HOME/dev/webpack"

# rust
pushpath $HOME/.cargo/bin

# aws s3
export S3BUCKET='bananalias-storage'

# dh-make (debian)
export DEBEMAIL="elias@bytekite.io"
export DEBFULLNAME="Elias Abderhalden"

# exa
exabase="exa 	--group-directories-first \
				--sort=Ext \
				--color=always"
exalong="$exabase 	--long \
					--group \
					--git \
					--links \
					--time-style=iso"
					#--created"




EXA_COLORS=""
# timestamp
EXA_COLORS="$EXA_COLORS:da=$GREY"
# timestamp
EXA_COLORS="$EXA_COLORS:da=$GREY"
# permissions user
EXA_COLORS="$EXA_COLORS:ur=$GREEN"
EXA_COLORS="$EXA_COLORS:uw=$GREEN"
EXA_COLORS="$EXA_COLORS:ux=$GREEN"
EXA_COLORS="$EXA_COLORS:ue=$GREEN"
# permissions group
EXA_COLORS="$EXA_COLORS:gr=$YELLOW"
EXA_COLORS="$EXA_COLORS:gw=$YELLOW"
EXA_COLORS="$EXA_COLORS:gx=$YELLOW"
# permissions all
EXA_COLORS="$EXA_COLORS:tr=$RED"
EXA_COLORS="$EXA_COLORS:tw=$RED"
EXA_COLORS="$EXA_COLORS:tx=$RED"
# owner (you, not you)
# group (you, not you)
EXA_COLORS="$EXA_COLORS:uu=$HI_GREY:un=$HI_RED"
EXA_COLORS="$EXA_COLORS:gu=$HI_GREY:gn=$HI_RED"
# size
EXA_COLORS="$EXA_COLORS:sn=$GREY"
EXA_COLORS="$EXA_COLORS:sb=$GREY"
# hardlinks
EXA_COLORS="$EXA_COLORS:lc=$GREY" # modified
# git
EXA_COLORS="$EXA_COLORS:gm=$MAGENTA" # modified
export EXA_COLORS


# ALIASES ---------------------------------------------------------------------


# bash
alias dot-bash='source ~/.bashrc'


# ls commands
alias ls="$exabase"
alias ll="$exalong --all"
#alias ls="/bin/ls --color=auto \
#	--group-directories-first --sort=extension"
#alias ll="/bin/ls -ao --color=auto \
#	--group-directories-first --human-readable --sort=extension"
## pages ls (scrolling ls)
#alias lsp="/bin/ls -ao --color \
#	--group-directories-first --sort=extension |
#	less -r"


# tree
alias xee="$exalong --all --tree"
alias tree="$exalong --tree --level 3"


# cd
# follow and expand symbolic links
alias cdd='cd -P'
# go up n levels
function cd_up() {
	cd $(printf "%0.s../" $(seq 1 $1));
	# this is a trick of parameter expansion.
	# printf repeats for every parameter not matched directly
}
alias cd.='cd_up'


# tmux
alias dot-tmux='tmux source-file ~/.tmux.conf'
alias tm='tmux -2 -u'
function tma() {
	if [ -z "$1" ]; then
		tmux attach
	else
		tmux attach-session -t $1
	fi
}
alias tmo='tmux attach-session #'
alias tms='tmux new -s'
alias tmls='tmux list-sessions'
# tmuxp
alias tmload='tmuxp load'


# git
alias g='git'

# status
alias gs='git status'
alias gs.='git status .'
alias gdif='git diff'
alias glog='git log --oneline'
alias ghis='git log --oneline --graph --all --decorate --abbrev-commit'

# commits
alias gadd='git add'
alias gaa='git add --all'
alias gcom='git commit'

# branches
alias gche='git checkout'
alias gbra='git branch'

# remotes
alias gpu='git push'
alias gfe='git fetch'
alias gpl='git pull'

# submodules
alias gsub='git submodule'
alias gsubup='git submodule update --recursive --remote'

# git gross - add, commit, push (named so because it isn't the best shortcut)
alias gross='git add . ; git commit ; git push'

# TODO: put this into shell script
function gist() {
	if [ -z "$1" ]; then
		git diff --stat HEAD HEAD~
	elif [ -z "$2" ]; then
		git diff --stat HEAD~$1 HEAD
	else
		git diff --stat HEAD~$1 HEAD~$2
	fi
}


# neovim
alias nv='nvim'


# vim
alias vimf='vim-text-files'
alias vimt='vimtype'


# grep
alias grep='grep --color=auto'


# python
alias py='python'
alias pyserve='python -m http.server 6000'


# df
alias df='df -h'


# tmsu
alias tir='tmsu'
alias tag='tmsu tag'

# wgnet (wireguard)
alias net='wgnet'



# golang
#alias go='export GOPATH=$GOPATH:$PWD'
alias gogen='go generate'
alias gom='GO111MODULE=on go'


# du
#alias dui='du --max-depth=1 -h | sort -hr'


# yq (yaml interpreter)
alias yq='yq.v2'


# LS COLORS -------------------------------------------------------------------

if [ -e ~/.dircolors ]; then
	eval $(dircolors -b ~/.dircolors)
else
    eval $(dircolors -b)
fi


# UNSET FUNCTIONS -------------------------------------------------------------

# remove functions to allow them only in this local bash shell
unset -f change_ls_color
unset -f pushpath


# BINDS -----------------------------------------------------------------------

# not in use because of the vi mode enabled in .inputrc.
# the .inputrc vi mode apparently has its own tab completion.
# still included just in case...
#bind "TAB:menu-complete"
#bind "set show-all-if-ambiguous on"



# ALIASES ---------------------------------------------------------------------
