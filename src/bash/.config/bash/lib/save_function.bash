#!/bin/bash

save_function() {
	local ORIG_FUNC=$(declare -f $1)
	if [ -z "$ORIG_FUNC" ]; then
		return 1
	fi
	local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
	eval "$NEWNAME_FUNC"
}


