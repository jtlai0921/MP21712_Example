#! /bin/bash
shopt -s extglob
read cmd
if [[ $cmd == @(declare|typeset) ]]; then
	echo 'Match.'
fi
