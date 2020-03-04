#!/bin/bash

l=40
pw=$(echo -n $PWD | sed "s:$HOME:\~:")
#pw="${PWD/$HOME/\~}"
if [ ${#pw} -ge $l ]; then
	reduced=$(echo -n $pw | tail -c $l)
	#echo $reduced
	#reduced=${pw:-$l}
	pw="...$reduced"
fi
echo $pw

