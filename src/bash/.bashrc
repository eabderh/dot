# shell
#------------------------------------------------------------------------------

# check if interactive shell, else exit
# https://unix.stackexchange.com/questions/70486/
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

source $HOME/.config/sh/config.bash
source $HOME/.config/bash/config.bash
source /etc/bash_completion


#------------------------------------------------------------------------------
