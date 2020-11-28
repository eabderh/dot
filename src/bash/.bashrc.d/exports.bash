#!/bin/bash

# admin
export EMAIL="elias@bytekite.io"

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
export LANGUAGE=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8

# terminal
export TERM=screen-256color

# less
export LESS='-R'

# dh-make (debian)
export DEBEMAIL="$EMAIL"
export DEBFULLNAME="Elias Abderhalden"

# aws s3
export S3BUCKET='bananalias-storage'

# golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/dev/go"
export GOSRC="$GOPATH/src"
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
export GO111MODULE=on
export GOPRIVATE=git.bananalias.xyz/*

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

# xelatex
export TEXHOME="$HOME/.local/lib/latex"
export TEXINPUTS="$TEXHOME//:"
export TTFONTS="/usr/share/fonts//:$HOME/.local/share/fonts//:"
export OPENTYPEFONTS="$HOME/.local/share/fonts//:"

# lego
export LEGO_PATH="$HOME/.local/etc/lego-ssl"
# lego namecheap
export NAMECHEAP_API_USER="bananalias"

# envy
export ENVY=$(which envy)

# aptly & aptlx
export APTLY_ROOT="$HOME/.local/var/lib/aptly"
export APTLX_ROOT="$HOME/.local/etc/aptlx/build.d"


