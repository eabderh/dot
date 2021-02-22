
# go up n levels
function cdup() {
	cd $(printf "%0.s../" $(seq 1 $1));
	# this is a trick of parameter expansion.
	# printf repeats for every parameter not matched directly
}
export -f cdup
alias cd.='cdup'

