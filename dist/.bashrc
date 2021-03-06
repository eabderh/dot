

# added in case of other bashrc
#if [ -f /etc/bashrc ]; then
#	source /etc/bashrc
#fi



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
shopt -s histverify
#export TERM=xterm-256color
#export TERM=screen-256color-s
export TERM=screen-256color
export PS1="\[\e[1;37m\][\u@\h] \$(python ~/.pwd.py 2> /dev/null) \$ \[\e[0m\]"
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

# gnupg (gpg)
TTY=$(tty)
TTY_owner=$(stat --format "%U" $TTY)
if [ ! $TTY_owner = $USER ]; then
	sudo chown $USER:$USER $TTY
fi
export GPG_TTY="$TTY"

# python
export PYTHONPATH=$HOME/dev/python/lib
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# golang
export GOROOT=/usr/local/go1.11
pushpath $GOROOT/bin
export GOPATH=$HOME/dev/go
pushpath $GOPATH/bin
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
pushpath $GOPATH/bin

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
					--all \
					--group \
					--git \
					--links \
					--time-style=iso \
					--created"
EXA_COLORS=""
# timestamp
EXA_COLORS="$EXA_COLORS:da=0;38"
# timestamp
EXA_COLORS="$EXA_COLORS:da=0;38"
# permissions user
EXA_COLORS="$EXA_COLORS:ur=1;36"
EXA_COLORS="$EXA_COLORS:uw=1;36"
EXA_COLORS="$EXA_COLORS:ux=1;36"
EXA_COLORS="$EXA_COLORS:ue=1;36"
# permissions user
EXA_COLORS="$EXA_COLORS:gr=1;32"
EXA_COLORS="$EXA_COLORS:gw=1;32"
EXA_COLORS="$EXA_COLORS:gx=1;32"
# permissions user
EXA_COLORS="$EXA_COLORS:tr=1;35"
EXA_COLORS="$EXA_COLORS:tw=1;35"
EXA_COLORS="$EXA_COLORS:tx=1;35"
# owners
EXA_COLORS="$EXA_COLORS:uu=9;36:un=0;35"
EXA_COLORS="$EXA_COLORS:gu=9;36:gn=0;35"
# size
EXA_COLORS="$EXA_COLORS:sn=0;38"
EXA_COLORS="$EXA_COLORS:sb=0;38"
# hardlinks
EXA_COLORS="$EXA_COLORS:lc=1;30" # modified
# git
EXA_COLORS="$EXA_COLORS:gm=0;35" # modified
export EXA_COLORS


# ALIASES ---------------------------------------------------------------------


# bash
alias dot-bash='source ~/.bashrc'


# ls commands
alias ls="$exabase"
alias ll="$exalong"
#alias ls="/bin/ls --color=auto \
#	--group-directories-first --sort=extension"
#alias ll="/bin/ls -ao --color=auto \
#	--group-directories-first --human-readable --sort=extension"
## pages ls (scrolling ls)
#alias lsp="/bin/ls -ao --color \
#	--group-directories-first --sort=extension |
#	less -r"


# tree
alias xee="$exalong --tree"
alias tree="$exalong --tree"


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


# du
#alias dui='du --max-depth=1 -h | sort -hr'


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

