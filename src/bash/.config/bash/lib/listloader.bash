

function listloader () {
	prefix="$1"
	suffix="$2"
	listfile="$prefix/dep.list"


	if [ ! -f $listfile ]; then
		find $prefix -name '*'".$suffix"
	else
		(
			# print list
			awk -v prefix=$prefix '{print prefix"/"$0}' "$listfile"
			# print files
			find $prefix -name '*'".$suffix"
		) | awk '!visited[$0]++' # remove duplicates without changing order
	fi
}

