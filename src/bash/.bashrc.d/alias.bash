#!/bin/bash

# ALIASES ---------------------------------------------------------------------


# sudo
#------------------------------------------------------------------------------

save_function() {
	local ORIG_FUNC=$(declare -f $1)
	if [ -z "$ORIG_FUNC" ]; then
		return 1
	fi
	local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
	eval "$NEWNAME_FUNC"
}

# bash
#------------------------------------------------------------------------------

alias dot-bash='source ~/.bashrc'

# sudo
#------------------------------------------------------------------------------

alias usudo='sudo env "PATH=$PATH"'

# interactive
#------------------------------------------------------------------------------

function mv() {
	/usr/bin/mv \
			--interactive \
			"$@"
}
export -f mv

function cp() {
	/usr/bin/cp \
			--interactive \
			"$@"
}
export -f cp

# ls commands
#------------------------------------------------------------------------------

function ls() {
	exa 	--group-directories-first \
			--sort=Ext \
			--color=always \
			"$@"
}
export -f ls

function ll() {
	ls 		--long \
			--group \
			--git \
			--links \
			--time-style=iso \
			--all \
			"$@"
}
export -f ll

# tree
#------------------------------------------------------------------------------

function xee() {
	ll 		--tree \
			--ignore-glob=.git \
			"$@"
}
export -f xee

function tree() {
	LEVEL=${1:-2}
	ll 		--tree \
			--ignore-glob=.git \
			--level $LEVEL
}
export -f tree

# cd
#------------------------------------------------------------------------------

# follow and expand symbolic links
alias cdd='cd -P'
# go up n levels
function cd_up() {
	cd $(printf "%0.s../" $(seq 1 $1));
	# this is a trick of parameter expansion.
	# printf repeats for every parameter not matched directly
}
export -f cd_up
alias cd.='cd_up'

# tmux
#------------------------------------------------------------------------------

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

# tmuxp
alias tmload='tmuxp load'

# git
#------------------------------------------------------------------------------

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
export -f gist
# update-server-info
alias gup='git update-server-info'

# neovim
#------------------------------------------------------------------------------

alias nv='nvim'

# vim
#------------------------------------------------------------------------------

alias vimf='vim-text-files'
alias vimt='vim-type-files'

# grep
#------------------------------------------------------------------------------

alias grep='grep --color=auto'

# df
#------------------------------------------------------------------------------

alias df='df -h'

# tmsu
#------------------------------------------------------------------------------

alias tir='tmsu'
alias tag='tmsu tag'

# golang
#------------------------------------------------------------------------------

alias gogen='go generate'

# fdfind
#------------------------------------------------------------------------------

alias fd='fdfind'

# other
#------------------------------------------------------------------------------

alias dateISO='date +%F'

# gpg
#------------------------------------------------------------------------------

function gpg() {
	gpg-connect-agent updatestartuptty /bye > /dev/null
	/usr/bin/gpg "$@"
}
export -f gpg

# pass
#------------------------------------------------------------------------------

function pass() {
	# shim the 'tree' command in the /usr/bin/pass shell script
	save_function tree tree_tmp
	function tree() {
		ll 	--tree \
			--ignore-glob=.git \
			"${@: -1}"
	}
	/usr/bin/pass "$@"
	save_function tree_tmp tree
	unset tree_tmp
}

#------------------------------------------------------------------------------


function lnharden() {
	ln -f "$(readlink $1)" $1
}

#------------------------------------------------------------------------------
