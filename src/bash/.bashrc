#!/bin/bash


# https://unix.stackexchange.com/questions/70486/transferring-files-ssh-scp-error-message-stdin-is-not-a-tty
case $- in
	*i*) ;;
	*) return;;
esac


# SOURCING --------------------------------------------------------------------

source /etc/bash_completion
for file in $HOME/.bashrc.d/*.bash; do
	#echo "sourcing $file"
	source $file
done


# SPECIAL ---------------------------------------------------------------------

# command line
shopt -s globstar
shopt -s histverify

# gnupg (gpg)
TTY=$(tty)
TTY_owner=$(stat --format "%U" $TTY)
if [ ! $TTY_owner = $USER ]; then
	sudo chown $USER:$USER $TTY
fi
gpgconf --launch gpg-agent
# make gpg use current tty (actually uses value in $GPG_TTY)
gpg-connect-agent updatestartuptty /bye > /dev/null

# history
mkdir -p "$HOME/.history.d"

# PATH ------------------------------------------------------------------------

function pushpath() {
	case ":$PATH:" in
		*":$1:"* 	) :;; # already in path
		* 			) export PATH="$PATH:$1";;
	esac
}

# os
pushpath /usr/local/bin
pushpath ~/.local/bin


# golang
pushpath $GOROOT/bin
pushpath $GOPATH/bin

# node / nodejs
pushpath $NODE_ROOT/bin

# rust
pushpath $HOME/.cargo/bin


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



