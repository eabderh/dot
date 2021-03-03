

source "$HOME/.config/bash/lib/listloader.bash"

for file in $(listloader "$HOME/.config/sh/config.d" "sh"); do
	source "$file"
done

