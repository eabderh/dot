#/bin/bash

# links all dot files in dist/ to the chosen destination directory

dir="$PWD"
dest="$1"

for i in $(find dist -maxdepth 1 -name '.*' ); do
	echo $(basename $i)
	cd $dest
	ln -s "$dir/$i"
	cd $dir
done


