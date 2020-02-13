#! /bin/bash
shopt -s -o nounset
DestDir=~/tmp
for f in $DestDir/*.txt
do
	echo $f
done