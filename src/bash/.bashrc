#!/bin/bash


# https://unix.stackexchange.com/questions/70486/transferring-files-ssh-scp-error-message-stdin-is-not-a-tty
case $- in
	*i*) ;;
	*) return;;
esac


# path
#------------------------------------------------------------------------------

if [ -z $PATH_ROOT ]; then
	export PATH_ROOT="$PATH"
fi
export PATH="$PATH_ROOT"

# sourcing
#------------------------------------------------------------------------------

#for file in $HOME/.bashrc.d/*.bash; do
#	#echo "sourcing $file"
#	source $file
#done

source $HOME/.config/sh/config.bash
source $HOME/.config/bash/config.bash
source /etc/bash_completion



#function pushpath() {
#	case ":$PATH:" in
#		*":$1:"* 	) :;; # already in path
#		* 			) export PATH="$PATH:$1";;
#	esac
#}
#unset -f pushpath



# os
#pushpath /usr/local/bin
#pushpath $LOCALROOT/usr/bin



# BINDS -----------------------------------------------------------------------

# not in use because of the vi mode enabled in .inputrc.
# the .inputrc vi mode apparently has its own tab completion.
# still included just in case...
#bind "TAB:menu-complete"
#bind "set show-all-if-ambiguous on"



