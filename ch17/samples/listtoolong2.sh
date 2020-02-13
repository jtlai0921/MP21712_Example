#! /bin/bash
shopt -s -o nounset
DestDir=~/tmp
while read f
do
	echo $f
done < <(find $DestDir -name '*.txt' | xargs -d \0 -n 1)
