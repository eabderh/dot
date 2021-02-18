
for file in $HOME/.config/bash/config.d/*.bash; do
	echo "$file"
	source $file
done


