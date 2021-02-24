

# g -> git
function g() 	{ git $@ 					;}; export -f g


# status
alias gs.='git status .'
function gs() 	{ git status --short $@ 	;}; export -f gs
function gdif() { git diff $@ 				;}; export -f gdif
function glog() { git log --oneline $@ 		;}; export -f glog


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


# history
function ghis() {
	git log \
		--oneline \
		--graph \
		--all \
		--decorate \
		--abbrev-commit $@
}; export -f ghis


# git gross - add, commit, push (named so because it isn't the best shortcut)
function gros() {
	git add .
	git commit
	git push
}; export -f gros


# TODO: put this into shell script
function gist() {
	if [ -z "$1" ]; then
		git diff --stat HEAD~ HEAD
	elif [ -z "$2" ]; then
		git diff --stat HEAD~$1 HEAD
	else
		git diff --stat HEAD~$1 HEAD~$2
	fi
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



