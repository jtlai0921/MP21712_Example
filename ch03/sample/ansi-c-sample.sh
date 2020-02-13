#! /bin/bash

IFS=$'\n'
for f in $(ls)
do
	echo $f
done
