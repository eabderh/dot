
source $HOME/.config/bash/lib/save_function.bash


export PASSWORD_STORE_DIR="$HOME/pass"
# in accordance with iam.swisscom.com
export PASSWORD_STORE_CHARACTER_SET='[:alnum:]~!@#\$%^*_+\-={}][?:;,.&'
#export PASSWORD_STORE_CHARACTER_SET='+\-='
#export PASSWORD_STORE_CHARACTER_SET='[:alnum:]'


function pass() {
	# shim the 'tree' command in the /usr/bin/pass shell script
	save_function tree tree_tmp
	function tree() {
		ll 	--tree \
			--ignore-glob=.git \
			"${@: -1}"
	}
	/usr/bin/pass "$@"
	save_function tree_tmp tree
	unset tree_tmp
}


