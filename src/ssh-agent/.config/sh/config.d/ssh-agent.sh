#!/bin/sh

export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
if [ ! -e $SSH_AUTH_SOCK ]; then
	tmp=$SSH_AUTH_SOCK
	eval "$(ssh-agent -s)" #> /dev/null

	# set actual ssh_auth_sock
	rm $tmp &> /dev/null
	ln -s $SSH_AUTH_SOCK $tmp
	export SSH_AUTH_SOCK=$tmp
fi

