#! /bin/bash
shopt -s extglob
opt=$1
if [[ $opt == @('--help'|'-h'|'?'|'/h') ]]; then
	echo "Usage: $0 選項 參數"
	exit 1
fi
