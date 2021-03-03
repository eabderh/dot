

source "$HOME/.config/bash/lib/listloader.bash"

for file in $(listloader "$HOME/.config/bash/config.d" "bash"); do
	source "$file"
done
#for file in $HOME/.config/bash/config.d/*.bash; do
#	source $file
#done


