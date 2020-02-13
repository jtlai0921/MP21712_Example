#! /bin/bash
IFS=':'
PL="root:x:0:0:root:/root:/bin/bash"
for f in $PL
do
	echo $f
done  