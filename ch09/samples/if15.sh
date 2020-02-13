#! /bin/bash
for i in $(cat file-list.txt); do
	if [[ $i =~ \./ch./ch.+\.txt ]]; then
	   rm $i
	fi
done
