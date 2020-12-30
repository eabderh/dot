#!/bin/bash

export LOCALROOT="$HOME/.local"
export SCRIPTSPATH="$LOCALROOT/bin"

# admin
export EMAIL="elias@bytekite.io"

# system
export SHELL=/bin/bash
[ -z $TZ ] && export TZ="/usr/share/zoneinfo/Europe/Zurich"

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

# aws
export AWS_CONFIG_FILE="$LOCALROOT/etc/aws/config"
#export AWS_SHARED_CREDENTIALS_FILE="$LOCALROOT/etc/aws/credentials"
export AWS_PASS_ROOT="personal/legals/accounts/aws"
# defaults
export AWS_SITE="bytekite.io"
export AWS_PROFILE="elias"
export AWS_REGION="eu-central-1"
# s3fs
export S3FS_CACHE="$LOCALROOT/cache/s3fs"
#export AWS_DEFAULT_BUCKET=""
#export AWS_PROFILE="elias"
#export S3BUCKET="bananalias-storage"

# golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/dev/src/go"
export GOSRC="$GOPATH/src"
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
export GO111MODULE=on
export GOPRIVATE=git.bananalias.xyz/*

# python
export PYTHONPATH=$HOME/dev/python/lib
export PYTHONSTARTUP=$HOME/.pythonstartup.py

# webpack
WEBPACK_WP="$HOME/dev/src/webpack"
WEBPACK_JAMES="$HOME/james/dev/src/webpack"
export WEBPACK_ROOTS="$WEBPACK_WP;$WEBPACK_JAMES"
export WEBPACK_ALIASES="WP;JAMES"
export WEBPACK_MODULES_PATH="node_modules;"\
"$WEBPACK_WP/node_modules;"\
"$WEBPACK_JAMES/node_modules;"\
"$WEBPACK_WP/loaders"

# node
export NODE_PATH="$WEBPACK_WP"
export NODE_ROOT=/usr/local/node

# gpg
export GPG_TTY="$(tty)"

# history
export HISTROOT="$HOME/.local/var/bash/history.d"
mkdir -p $HISTROOT
export HISTFILE="$HISTROOT/$(tty | sed -e 's;/;;g')"

# xelatex
export TEXHOME="$LOCALROOT/usr/lib/latex"
export TEXINPUTS="$TEXHOME//:"
export TTFONTS="/usr/share/fonts//:$LOCALROOT/usr/share/fonts//:"
export OPENTYPEFONTS="$LOCALROOT/usr/share/fonts//:"

# lego
export LEGO_PATH="$LOCALROOT/etc/lego-ssl"
# lego namecheap
export NAMECHEAP_PASS_ROOT="personal/legals/accounts/namecheap"
export NAMECHEAP_API_USER="bananalias"

# envy
export ENVY=$(which envy)

# aptly & aptlx
export APTLY_ROOT="$LOCALROOT/var/lib/aptly"
export APTLX_ROOT="$LOCALROOT/etc/aptlx/build.d"


