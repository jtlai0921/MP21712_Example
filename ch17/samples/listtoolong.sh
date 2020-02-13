#! /bin/bash
shopt -s -o nounset
DestDir=~/tmp
while read f 
do
	echo $f
done < <(ls $DestDir | xargs -d \0 -n 1)
