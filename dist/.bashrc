

# added in case of other bashrc
#if [ -f /etc/bashrc ]; then
#	source /etc/bashrc
#fi



# SYSTEM ----------------------------------------------------------------------

# os
export PATH=${PATH}:~/.local/bin
export PATH=${PATH}:~/dev/userbin

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
export TERM=screen-256color-s
export NICKNAME=bananalias
export PS1="\[\e[37;1m\][\u@$NICKNAME] \$(python ~/.pwd.py) \$ \[\e[0m\]"
#export PS1="\[\e[37;1m\][\u@\h] \w \$ \[\e[0m\]"

# python
export PYTHONPATH=$HOME/dev/python/lib
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# golang
export PATH=$PATH:/usr/local/go/bin
JAMES=$HOME/dev/james
export GOPATH=$JAMES/go
export PATH=$PATH:$JAMES/go/bin

# ALIASES ---------------------------------------------------------------------


# ls commands
alias ls="/bin/ls --color=auto \
	--group-directories-first --sort=extension"
alias ll="/bin/ls -ao --color=auto \
	--group-directories-first --sort=extension"
# pages ls (scrolling ls)
alias lsp="/bin/ls -ao --color \
	--group-directories-first --sort=extension |
	less -r"


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
alias tm='tmux -2 -u'
function tmux_attach() {
	if [ -z "$1" ]; then
		tmux attach
	else
		tmux attach-session -t $1
	fi
}
alias tma='tmux_attach'
alias tmo='tmux attach-session #'
alias tms='tmux new -s'
alias tmls='tmux list-sessions'
# tmuxp
alias tmload='tmuxp load'


# git
alias g='git'
alias gs='git status'
alias gs='git status'
alias gs.='git status .'
alias gcom='git commit'
alias gadd='git add'
alias gaa='git add --all'
alias gche='git checkout'
alias gdif='git diff'
alias glog='git log --oneline'
alias ghis='git log --oneline --graph --all --decorate --abbrev-commit'


# vim
alias vimf='vim $(find . -maxdepth 1 -exec file {} + '\
'| grep text | cut -d: -f1)'


# python
alias py='python'
alias pyserve='python -m http.server 6000'


# tree
alias trees='tree -d -L'


# go
#alias go='export GOPATH=$GOPATH:$PWD'


# LS COLORS -------------------------------------------------------------------

# change colors of ls output
function change_ls_color() {
if [[ $LS_COLORS == *$1* ]]; then
	LS_COLORS=$(echo $LS_COLORS | \
		sed -r "s/(:"$1"=)[^:]*/\1"$2"/")
else
	LS_COLORS=$LS_COLORS$1=$2:
fi
}

# directories
change_ls_color "di" "01;34"
# executables
change_ls_color "ex" "01;32"
# linked
change_ls_color "ln" "01;36"

change_ls_color "tw" "01;34"
change_ls_color "ow" "01;34"

# compression files
change_ls_color "*.zip" "01;31"
change_ls_color "*.tar" "01;31"
change_ls_color "*.tgz" "01;31"
change_ls_color "*.7z" "01;31"

export LS_COLORS

# remove function change_ls_color to make it only local
unset -f change_ls_color



# BINDS -----------------------------------------------------------------------

# not in use because of the vi mode enabled in .inputrc.
# the .inputrc vi mode apparently has its own tab completion.
# still included just in case...
#bind "TAB:menu-complete"
#bind "set show-all-if-ambiguous on"

