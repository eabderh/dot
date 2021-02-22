


# colors
#------------------------------------------------------------------------------

source $HOME/.config/bash/lib/colors.bash

EXA_COLORS=""
# timestamp
EXA_COLORS="$EXA_COLORS:da=$GREY"
# timestamp
EXA_COLORS="$EXA_COLORS:da=$GREY"
# permissions user
EXA_COLORS="$EXA_COLORS:ur=$GREEN"
EXA_COLORS="$EXA_COLORS:uw=$GREEN"
EXA_COLORS="$EXA_COLORS:ux=$GREEN"
EXA_COLORS="$EXA_COLORS:ue=$GREEN"
# permissions group
EXA_COLORS="$EXA_COLORS:gr=$YELLOW"
EXA_COLORS="$EXA_COLORS:gw=$YELLOW"
EXA_COLORS="$EXA_COLORS:gx=$YELLOW"
# permissions all
EXA_COLORS="$EXA_COLORS:tr=$RED"
EXA_COLORS="$EXA_COLORS:tw=$RED"
EXA_COLORS="$EXA_COLORS:tx=$RED"
# owner (you, not you)
# group (you, not you)
EXA_COLORS="$EXA_COLORS:uu=$HI_GREY:un=$HI_RED"
EXA_COLORS="$EXA_COLORS:gu=$HI_GREY:gn=$HI_RED"
# size
EXA_COLORS="$EXA_COLORS:sn=$GREY"
EXA_COLORS="$EXA_COLORS:sb=$GREY"
# hardlinks
EXA_COLORS="$EXA_COLORS:lc=$GREY" # modified
# git
EXA_COLORS="$EXA_COLORS:gm=$MAGENTA" # modified
export EXA_COLORS


# tree
#------------------------------------------------------------------------------

function xee() {
	ll 		--tree \
			--ignore-glob=.git \
			"$@"
}
export -f xee

function tree() {
	LEVEL=${1:-2}
	ll 		--tree \
			--ignore-glob=.git \
			--level $LEVEL
}
export -f tree

#------------------------------------------------------------------------------
