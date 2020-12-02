#!/bin/bash

# ALIASES ---------------------------------------------------------------------

# sudo
#------------------------------------------------------------------------------

alias usudo='sudo env "PATH=$PATH"'

# bash
#------------------------------------------------------------------------------

alias dot-bash='source ~/.bashrc'

# ls commands
#------------------------------------------------------------------------------

exabase="exa 	--group-directories-first \
				--sort=Ext \
				--color=always"
exalong="$exabase 	--long \
					--group \
					--git \
					--links \
					--time-style=iso"
					#--created"
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
#------------------------------------------------------------------------------
alias xee="$exalong --all --tree"
alias tree="$exalong --tree --level 2"

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

# python
#------------------------------------------------------------------------------
alias py='python'
alias pyserve='python -m http.server 6000'

# df
#------------------------------------------------------------------------------
alias df='df -h'

# tmsu
#------------------------------------------------------------------------------
alias tir='tmsu'
alias tag='tmsu tag'

# wgnet (wireguard)
#------------------------------------------------------------------------------
alias net='wgnet'

# golang
#------------------------------------------------------------------------------
alias gogen='go generate'
alias gom='GO111MODULE=on go'

# yq (yaml interpreter)
#------------------------------------------------------------------------------
alias yq='yq.v2'

# fdfind
#------------------------------------------------------------------------------
alias fd='fdfind'

# other
#------------------------------------------------------------------------------
alias dateISO='date +%F'

#------------------------------------------------------------------------------
