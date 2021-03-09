

# basic functions

#------------------------------------------------------------------------------

# g -> git
function g() 	{ git "$@" 					;}; export -f g


# status
alias gs.='git status .'
function gs() 	{ git status --short "$@" 	;}; export -f gs
function gdif() { git diff "$@" 			;}; export -f gdif


# commits
function gadd() { git add "$@" 				;}; export -f gadd
function gaa() 	{ git add --all "$@" 		;}; export -f gaa
function gcom() { git commit "$@" 			;}; export -f gcom


# branches
function gche() { git checkout "$@" 		;}; export -f gche
function gbra() { git branch "$@" 			;}; export -f gbra


# remotes
function gfe() 	{ git fetch "$@" 			;}; export -f gfe
function gpu() 	{ git push "$@" 			;}; export -f gpu
function gpl() 	{ git pull "$@" 			;}; export -f gpl


# update-server-info
function gup() 	{ git update-server-info "$@" ;}; export -f gup




# git log functions
#------------------------------------------------------------------------------

# format fragments


# basic format without subject
#unset HASH TIME AUTHOR_EMAIL REF INDENT SUBJECT

# short git log version
function glog() {
	INDENT='         '
	REF='%C(green)%d'
	TIME='%C(blue)%<(10)%ad'
	SUBJECT='%C(reset)%<(50,trunc)%s'
	AUTHOR_EMAIL='%C(blue)%>(20,trunc)%ae'
	RESET='%C(reset)'
	# 82						10   1 50 	   1 20
	FORMAT="$INDENT $REF %n$TIME $SUBJECT $AUTHOR_EMAIL$RESET"
	# turn on color; remove empty lines (including ansi escape codes) with sed
	git \
		log \
		--color \
		--date=short \
		--pretty=format:"$FORMAT" \
		"$@" |
		sed '/^\s*\x1b\[[0-9;]*m\s*$/d' |
		less
	#echo; echo
		#--graph \
}; export -f glog

function gl() {
	glog "$@"
}; export -f gl

# historic git log version (added stat and summary)
function ghis() {
	INDENT='       '
	REF='%C(green)%d'
	HASH='%C(yellow)%h'
	TIME='%C(reset)%ai %C(cyan)(%ar)'
	AUTHOR_EMAIL='%C(reset)%ae %C(magenta)(%an)'
	SUBJECT='%C(blue)%s'
	BODY='%C(white)%b'
	RESET='%C(reset)'
	FORMAT="$INDENT $REF%n$HASH  $SUBJECT%n$INDENT  $TIME%n$INDENT  $AUTHOR_EMAIL%n$BODY$RESET"
	# disable colored +/- from --stat
	git \
		-c color.diff.new=white \
		-c color.diff.old=white \
		log \
		--pretty=format:"$FORMAT" \
		--stat \
		--summary \
		"$@"
	echo; echo
}; export -f ghis

# 'lore' git log version
function glore() {
	git log \
		--format=fuller \
		--date=iso \
		--stat \
		--all \
		--decorate \
		--abbrev-commit "$@"
		#--graph \
}; export -f glore



# other functions
#------------------------------------------------------------------------------

# git gross - add, commit, push (named so because it isn't the best shortcut)
function gros() {
	git add .
	git commit
	git push
}; export -f gros


# TODO: put this into shell script
function gist() {
	# how far back to start
	START="HEAD~${1:-1}"
	# how far back to end
	END="HEAD~${2:-0}"
	git --no-pager diff --stat --summary $START $END
}; export -f gist


# check if dirty
function gss() {
	if [ -z "$(git status --porcelain)" ]; then
		return 0
	fi
	echo dirty
	return 1
}; export -f gss


# submodules
function gsub() { git submodule "$@" ;}; export -f gsub
function gsubup() {
	git submodule update --recursive --remote "$@"
}; export -f gsubup



