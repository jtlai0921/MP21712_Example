#! /bin/bash
for line in $(<erfile.txt)
do
	printf '%s\n' "$line"
done
