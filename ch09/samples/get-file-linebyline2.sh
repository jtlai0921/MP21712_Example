#! /bin/bash
IFS=$'\n'
set -f
for line in $(<erfile.txt)
do
	printf '%s\n' "$line"
done
