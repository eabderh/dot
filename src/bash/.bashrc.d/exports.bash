#!/bin/bash

# system
export SHELL=/bin/bash

# history
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTSIZE="1000"
export PROMPT_COMMAND="history -a"

# ssh
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# editor
export EDITOR=vim;
export VISUAL=vim;

# encoding
export LC_CTYPE=C
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# terminal
export TERM=screen-256color

# less
export LESS='-R'

# dh-make (debian)
export DEBEMAIL="elias@bytekite.io"
export DEBFULLNAME="Elias Abderhalden"

# aws s3
export S3BUCKET='bananalias-storage'

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
export GO111MODULE=off
export GOPRIVATE=bytekite.io/x/*

# python
export PYTHONPATH=$HOME/dev/python/lib
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# node
export NODE_PATH="$HOME/dev/webpack"
export NODE_ROOT=/usr/local/node

# gpg
export GPG_TTY="$(tty)"

# history
export HISTFILE="$HOME/.history.d/$(tty | sed -e 's;/;;g')"



