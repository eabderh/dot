#!/bin/bash




# mv
#------------------------------------------------------------------------------

function mv() {
	/usr/bin/mv \
			--interactive \
			"$@"
}
export -f mv




# cp
#------------------------------------------------------------------------------

function cp() {
	/usr/bin/cp \
			--interactive \
			"$@"
}
export -f cp




# ls
#------------------------------------------------------------------------------

function ls() {
	exa 	--group-directories-first \
			--sort=Ext \
			--color=always \
			"$@"
}
export -f ls




# ll
#------------------------------------------------------------------------------

function ll() {
	ls 		--long \
			--group \
			--git \
			--links \
			--time-style=iso \
			--all \
			"$@"
}
export -f ll




# df
#------------------------------------------------------------------------------

alias df='df -h'




# date
#------------------------------------------------------------------------------

alias dateISO='date +%F'




# ls colors
#------------------------------------------------------------------------------

if [ -e $HOME/.dircolors ]; then
	eval $(dircolors -b ~/.dircolors)
else
    eval $(dircolors -b)
fi



#------------------------------------------------------------------------------