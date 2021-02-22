

# set owner of current tty
#------------------------------------------------------------------------------

## get owner of tty file
#TTY_owner=$(stat --format "%U" $(tty))
#if [ ! $TTY_owner = $USER ]; then
#	sudo chown $USER:$USER $TTY
#fi


# set gpg function
#------------------------------------------------------------------------------

function gpg() {
	# reset gpg tty
	gpg-connect-agent updatestartuptty /bye > /dev/null
	/usr/bin/gpg "$@"
}
export -f gpg


#------------------------------------------------------------------------------
