#/bin/bash

dir="$PWD"
dest="$1"

mkdir -p "$dest/.tmp/dotfiles"
for i in $(find dist -maxdepth 1 -name '.*' ); do
	cd $dest
	mv $(basename $i) tmp/dotfiles/.
	cd $dir
done


