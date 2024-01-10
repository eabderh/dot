# equivalent to using 'cd ..' multiple times
# usage: cdup <levels>
# 	<levels>: defaults to 1


# go up n levels
function cdup() {
	cd $(printf "%0.s../" $(seq 1 $1));
	# this is a trick of parameter expansion
	# printf repeats for every parameter not matched directly
}
export -f cdup

# alias of 'cdup' to 'cd.'
function cd. { cdup $@; }; export -f cd.

