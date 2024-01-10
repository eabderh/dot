# TODO: replace with actual packages/scripts

source /usr/share/bash-completion/completions/git

#------------------------------------------------------------------------------

function gitfilefilter {
	while read p; do
		git ls-files --error-unmatch $p 2>/dev/null || true
	done < /dev/stdin
}; export -f gitfilefilter


#------------------------------------------------------------------------------

function gitfileblame {

	if [ "$1" == '-' ]; then
		local files="$( cat /dev/stdin )"
	elif [ "$#" != '0' ]; then
		local files="$( echo "$@" | tr ' ' '\n' )"
	fi

	#echo "$files" | gitfilefilter
	#return 1

	local format="  %h:%n    info: %ai [%an]%n    sub: '%s'"
	while read file; do
		# TODO: improve format
		echo "${file}:"
		git --no-pager log --follow --format="$format" ${file}
		#git --no-pager log --format="  commit: %h (%ai)%n  user: %an%n  subject: %s" ${file}

	done < <( echo "$files" | gitfilefilter )
	#done < <( cat /dev/stdin | (echo "$@") | gitfilefilter ) \
}; export -f gitfileblame


#------------------------------------------------------------------------------

# jump to branch without updating the files in the current directory
function gitjump {
	head="$(git rev-parse HEAD)"
	git checkout "$@"
	git checkout "$head" -- .
	git reset
}; export -f gitjump
#__git_complete gitjump _git_checkout


#------------------------------------------------------------------------------

function rerebase {

	local head="$(git symbolic-ref --short HEAD)"
	local pattern="${1}"
	local base="${2}"
	if [ "$pattern" == "" ]; then
		pattern='*'
	fi
	if [ "$base" != "" ]; then
		local headcmd="--onto=${head}"
		local contains="--contains ${base} --no-merged ${base} --no-contains ${head}"
	else
		local headcmd="${head}"
		local contains="--no-contains HEAD"
	fi


	local branches="$(
		git --no-pager branch \
			--format="%(refname:short)" \
			--list "$pattern" \
			$contains
	)"

	if [ "$branches" == "" ]; then
		return 0
	fi

	echo "# working on ${head}"
	echo "set -e"


	for branch in $branches; do
		echo "git rebase ${headcmd} ${base} ${branch}"
		echo "git checkout ${head}"
	done

}; export -f rerebase
__git_complete rerebase _git_branch


#------------------------------------------------------------------------------
## function gref {
## 	format=""
## 	format+="type=%(objecttype);"
## 	format+="ref=%(refname);"
## 	format+="committerdate=%(committerdate);"
## 	format+="t=%ae;"
## 	local branches="$(
## 		(
## 			format+="refshort=%(refname:lstrip=2);"
## 			format+="remotename='';"
## 			format+="reftype='head';merged='true';"
## 			git for-each-ref \
## 				--shell \
## 				--format="$format" \
## 				--merged='HEAD' \
## 				refs/heads
## 		)
## 		(
## 			format+="refshort=%(refname:lstrip=2);"
## 			format+="remotename='';"
## 			format+="reftype='head';merged='';"
## 			git for-each-ref \
## 				--shell \
## 				--format="$format" \
## 				--no-merged='HEAD' \
## 				refs/heads
## 		)
## 		(
## 			format+="refshort=%(refname:lstrip=3);"
## 			format+="remotename=%(refname:rstrip=-3);"
## 			format+="reftype='remote';merged='true';"
## 			git for-each-ref \
## 				--shell \
## 				--format="$format" \
## 				--merged='HEAD' \
## 				refs/remotes
## 		)
## 		(
## 			format+="refshort=%(refname:lstrip=3);"
## 			format+="remotename=%(refname:rstrip=-3);"
## 			format+="reftype='remote';merged='';"
## 			git for-each-ref \
## 				--shell \
## 				--format="$format" \
## 				--no-merged='HEAD' \
## 				refs/remotes
## 		)
## 	)"
## 
## 
## }; export -f gref
## __git_complete gref _git_branch
## 
## function gitdelete {
## 	local pattern="${1}"
## 	if [ "$pattern" == "" ]; then
## 		pattern='*'
## 	fi
## 
## 	format=""
## 	format+="type=%(objecttype);"
## 	format+="ref=%(refname);"
## 	format+="refshort=%(refname:lstrip=2);"
## 	format+="remotename='';"
## 	format+="reftype='head';merged='true';"
## 	local branchesr="$(
## 		git for-each-ref \
## 			--shell \
## 			--format="$format" \
## 	)"
## 
## 	for l in $branches; do
## 		eval "$branch"
## 		local upstream="$(
## 			git --no-pager branch \
## 				--format="%(upstream:lstrip=3)" \
## 				--list "$branch"
## 		)" # the :lstrip=3 removes /ref/remotes/<remote> from the path
## 		local remote="$(
## 			git --no-pager branch \
## 				--format="%(upstream:remotename)" \
## 				--list "$branch"
## 		)"
## 		local merged="$(
## 			git --no-pager branch \
## 				--format="%(refname:short)" \
## 				--list "$branch" \
## 				--merged HEAD
## 		)"
## 	done
## 
## 
## 
## 	### local branches="$(
## 	### 	(
## 	### 		format+="refshort=%(refname:lstrip=2);"
## 	### 		format+="remotename='';"
## 	### 		format+="reftype='head';merged='true';"
## 	### 		git for-each-ref \
## 	### 			--shell \
## 	### 			--format="$format" \
## 	### 			--merged='HEAD' \
## 	### 			refs/heads
## 	### 	)
## 	### 	(
## 	### 		format+="refshort=%(refname:lstrip=2);"
## 	### 		format+="remotename='';"
## 	### 		format+="reftype='head';merged='';"
## 	### 		git for-each-ref \
## 	### 			--shell \
## 	### 			--format="$format" \
## 	### 			--no-merged='HEAD' \
## 	### 			refs/heads
## 	### 	)
## 	### 	(
## 	### 		format+="refshort=%(refname:lstrip=3);"
## 	### 		format+="remotename=%(refname:rstrip=-3);"
## 	### 		format+="reftype='remote';merged='true';"
## 	### 		git for-each-ref \
## 	### 			--shell \
## 	### 			--format="$format" \
## 	### 			--merged='HEAD' \
## 	### 			refs/remotes
## 	### 	)
## 	### 	(
## 	### 		format+="refshort=%(refname:lstrip=3);"
## 	### 		format+="remotename=%(refname:rstrip=-3);"
## 	### 		format+="reftype='remote';merged='';"
## 	### 		git for-each-ref \
## 	### 			--shell \
## 	### 			--format="$format" \
## 	### 			--no-merged='HEAD' \
## 	### 			refs/remotes
## 	### 	)
## 	### )"
## 	#echo -e "$branches"
## 	#exit 0
## 	while read -r l; do
## 	#for l in "$branches"; do
## 		echo "TTTTTTT $l"
## 		eval "$l"
## 		#echo "ref: $ref"
## 		#echo "type: $type"
## 		#echo "reftype: $reftype"
## 		#echo "merged: $merged"
## 		#echo "committerdate: $committerdate"
## 		#echo "$remotename"
## 
## 		#echo "ref: $ref"
## 		#echo "refshort: $refshort"
## 		if [[ "$refshort" != "master" && "$refshort" != "HEAD" ]]; then
## 
## 			if [[ "$reftype" == "remote" && "$merged" != "" ]]; then
## 				remotename="$(echo "$remotename" | sed -e 's:refs/remotes/::')"
## 				echo "# $committerdate"
## 				echo git push "$remotename" --delete "$refshort"
## 
## 			fi
## 		fi
## 
## 	done < <(echo "$branches")
## 	return 0
## 
## 	#while IFS=  read xx yy zz;do
## 	#	echo $xx $yy $zz
## 	#done < input_file
## 
## 	branches="$(echo "$branches" | grep -v '^master$')"
## 
## 
## 	for branch in $branches; do
## 		local upstream="$(
## 			git --no-pager branch \
## 				--format="%(upstream:lstrip=3)" \
## 				--list "$branch"
## 		)" # the :lstrip=3 removes /ref/remotes/<remote> from the path
## 		local remote="$(
## 			git --no-pager branch \
## 				--format="%(upstream:remotename)" \
## 				--list "$branch"
## 		)"
## 		local merged="$(
## 			git --no-pager branch \
## 				--format="%(refname:short)" \
## 				--list "$branch" \
## 				--merged HEAD
## 		)"
## 	
## 		#echo "----"
## 		if [ "$upstream" != "" ]; then
## 			echo git push "$remote" --delete "$upstream"
## 		fi
## 		if [ "$merged" != "" ]; then
## 			echo git branch --delete "$branch"
## 		else
## 			echo git branch -D "$branch"
## 		fi
## 
## 	done
## 
## }; export -f gitdelete
## __git_complete gitdelete _git_branch

#------------------------------------------------------------------------------


function gitforce {
	local pattern="${1}"
	if [ "$pattern" == "" ]; then
		pattern='*'
	fi

	local branches="$(
		git --no-pager branch \
			--format="%(refname:short)" \
			--list "$pattern"
	)"

	#branches="$(echo "$branches" | grep -v '^master$')"

	
	for branch in $branches; do
		local upstream="$(
			git --no-pager branch \
				--format="%(upstream:lstrip=3)" \
				--list "$branch"
		)" # the :lstrip=3 removes /ref/remotes/<remote> from the path
		local track="$(
			git --no-pager branch \
				--format="%(upstream:trackshort)" \
				--list "$branch"
		)"
		local remote="$(
			git --no-pager branch \
				--format="%(upstream:remotename)" \
				--list "$branch"
		)"

		#echo "# [$remote] [$branch] [$upstream] [$track]"

		if [[ "$upstream" != '' && "$track" == '' ]]; then
			echo git branch -D "$branch"
		elif [[ "$track" == '<' ]]; then
			# pull
			# https://stackoverflow.com/a/19205680
			echo git fetch "$remote" --update-head-ok "$upstream":"$branch"
		elif [[ "$track" == '>' ]]; then
			# push
			echo git push "$remote" "$branch"
		elif [[ "$track" == '<>' ]]; then
			# push force
			echo git push "$remote" --force "$branch"
		fi

	done

}; export -f gitforce
__git_complete gitforce _git_branch


#------------------------------------------------------------------------------
