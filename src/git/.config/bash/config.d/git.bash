

# basic functions

#------------------------------------------------------------------------------

# g -> git
function g() 	{ git $@ 					;}; export -f g


# status
alias gs.='git status .'
function gs() 	{ git status --short $@ 	;}; export -f gs
function gdif() { git diff $@ 				;}; export -f gdif


# commits
function gadd() { git add $@ 				;}; export -f gadd
function gaa() 	{ git add --all $@ 			;}; export -f gaa
function gcom() { git commit $@ 			;}; export -f gcom


# branches
function gche() { git checkout $@ 			;}; export -f gche
function gbra() { git branch $@ 			;}; export -f gbra


# remotes
function gfe() 	{ git fetch $@ 				;}; export -f gfe
function gpu() 	{ git push $@ 				;}; export -f gpu
function gpl() 	{ git pull $@ 				;}; export -f gpl


# update-server-info
function gup() 	{ git update-server-info $@ ;}; export -f gup




# git log functions
#------------------------------------------------------------------------------

# format fragments

HASH='%C(white)%h'
TIME='  %C(blue)%<(13)%ad'
AUTHOR_EMAIL='  %C(blue)%<(20,trunc)%ae'
REF='%C(green)%d'
INDENT='%C(white)       '
SUBJECT='  %C(cyan)%<(50,trunc)%s'

# basic format without subject
export GITLOGFORMAT="$INDENT $REF%n$HASH$TIME$AUTHOR_EMAIL%n$INDENT$SUBJECT"
unset HASH TIME AUTHOR_EMAIL REF INDENT SUBJECT

# short git log version
function glog() {
	git log \
		--pretty=format:"$GITLOGFORMAT" \
		--date=relative \
		"$@"
		#--graph \
}; export -f glog

# long git log version (added stat and summary)
function glogs() {
	# disable colored +/- from --stat
	git \
		-c color.diff.new=white \
		-c color.diff.old=white \
		log \
		--pretty=format:"$GITLOGFORMAT" \
		--date=relative \
		--stat \
		--summary \
		"$@"
}; export -f glogs

# historic git log version
function ghis() {
	git log \
		--format=medium \
		--date=iso \
		--stat \
		--all \
		--decorate \
		--abbrev-commit $@
		#--graph \
}; export -f ghis



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
	START="HEAD~${1:-0}"
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
function gsub() { git submodule $@ 	;}; export -f gsub
function gsubup() {
	git submodule update --recursive --remote $@
}; export -f gsubup



