

if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then
		source "$HOME/.bashrc"
	fi
fi

export PATH=$PATH:$HOME/bin
#export LANG=de.DE
#export LC_CTYPE=elias.ansix3elias
#export LANG=elias.ansix3elias
#export LC_CTYPE=elias.ansix3elias

