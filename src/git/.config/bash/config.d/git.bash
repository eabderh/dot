



source /usr/share/bash-completion/completions/git

# basic functions

#------------------------------------------------------------------------------

# g -> git
function g() 	{ git "$@" 					;}; export -f g
__git_complete g __git_main


# status
alias gs.='git status .'
function gs() 	{ git status --short --branch "$@" 	;}; export -f gs
__git_complete gs _git_status


function gdif() { git diff "$@" 			;}; export -f gdif
__git_complete gdif _git_diff


# commits
function gadd() { git add "$@" 				;}; export -f gadd
function gaa() 	{ git add --all "$@" 		;}; export -f gaa
function gcom() { git commit "$@" 			;}; export -f gcom


# branches
function gche() { git checkout "$@" 		;}; export -f gche
__git_complete gche _git_checkout
function gbra() { git branch "$@" 			;}; export -f gbra
__git_complete gbra _git_branch


# remotes
function gfe() 	{ git fetch "$@" 			;}; export -f gfe
__git_complete gfe _git_fetch
function gup() 	{ git push "$@" 			;}; export -f gup
__git_complete gup _git_push
function gdo() 	{ git pull "$@" 			;}; export -f gdo
__git_complete gdo _git_pull
function grem() { git remote -v "$@" 		;}; export -f grem
__git_complete grem _git_remote


# tracking
function gref() {
	local header='%(HEAD)'
	local refname='%(color:blue)%(refname:short)'
	local upstream='%(color:cyan)%(upstream:short)'
	local tracking='%(color:yellow)%(upstream:track)'
	git for-each-ref --color=always \
		--format="$header $refname,$upstream $tracking" \
		| column -t -s','
}; export -f gref




# update-server-info
function gupdate() 	{ git update-server-info "$@" ;}; export -f gupdate




# git log functions
#------------------------------------------------------------------------------

# format fragments


function ggraph() {
	local indent='         ' # 11
	local ref='%C(green)%d'
	local time='%C(yellow)%<(10)%ad'
	#local hash='%C(yellow)%h'
	#local time='%C(blue)%<(10)%ad'
	local subject='%C(reset)%<(60,trunc)%s'
	local author_email='%C(blue)%<(18,trunc)%ae'
	local reset='%C(reset)'
	local format="${time}${ref}%n${author_email} ${subject}${reset}%n"
	# turn on color; remove empty lines (including ansi escape codes) with sed
	git \
		-c core.pager='less -S' \
		log \
		--color \
		--date=short \
		--pretty=format:"$format" \
		--graph \
		"$@"
		#sed '/^\s*\x1b\[[0-9;]*m\s*$/d' |
		#less
	#echo; echo
}; export -f ggraph

function gg() {
	ggraph "$@"
}; export -f gg

# short git log version
function glog() {
	local indent='         '
	local ref='%C(green)%d'
	local time='%C(yellow)%<(10)%ad'
	local subject='%C(reset)%<(50,trunc)%s'
	local author_email='%C(blue)%<(18,trunc)%ae'
	local reset='%C(reset)'
	local format="${time}${ref}%n${author_email} ${subject}${reset}%n"
	# turn on color; remove empty lines (including ansi escape codes) with sed
	git \
		log \
		--color \
		--date=short \
		--pretty=format:"$format" \
		"$@"
		#sed '/^\s*\x1b\[[0-9;]*m\s*$/d' |
		#less
		#--graph \
	#echo; echo
}; export -f glog

function gl() {
	glog "$@"
}; export -f gl

# historic git log version (added stat and summary)
function ghis() {
	local indent='       '
	local ref='%C(green)%d'
	local hash='%C(yellow)%h'
	local time='%C(reset)%ai %C(cyan)(%ar)'
	local author_email='%C(reset)%ae %C(magenta)(%an)'
	local subject='%C(blue)%s'
	local body='%C(white)%b'
	local reset='%C(reset)'
	local format="${indent} ${ref}%n${hash}  ${subject}%n${indent}  ${time}%n${indent}  ${author_email}%n${body}${reset}"
	# disable colored +/- from --stat
	git \
		-c color.diff.new=white \
		-c color.diff.old=white \
		log \
		--pretty=format:"$format" \
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

# git gros - add, commit, push (named so because it isn't the best shortcut)
function gros() {
	if [ "$1" == "" ]; then
		echo 'commit message missing'
		return 1
	fi
	git add --update
	git commit --message="$1"
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


## credentials
##------------------------------------------------------------------------------
#
#
## submodules
#function git-credential-test() {
#	echo "git-credential-test $@" 1>&2
#	cat /dev/stdin 1>&2
#}; export -f git-credential-test



