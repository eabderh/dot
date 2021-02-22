






# start gpg
#------------------------------------------------------------------------------

# envar for which tty to use
export GPG_TTY="$(tty)"
# launch gpg
gpgconf --launch gpg-agent
# make gpg use current tty (actually uses value in $GPG_TTY)
gpg-connect-agent updatestartuptty /bye > /dev/null



# set owner of current tty
#------------------------------------------------------------------------------

# get owner of tty file
TTY_owner=$(stat --format "%U" $(tty))
if [ ! $TTY_owner = $USER ]; then
	sudo chown $USER:$USER $GPG_TTY
fi



#------------------------------------------------------------------------------
