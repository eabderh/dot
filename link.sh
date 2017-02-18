#/bin/bash

dir="$PWD"
dest="$1"

for i in $(find dist -maxdepth 1 -name '.*' ); do
	echo $(basename $i)
	cd $dest
	ln -s "$dir/$i"
	cd $dir
done


