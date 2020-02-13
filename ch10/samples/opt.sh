#! /bin/bash
while getopts u:ah opt
do
	case $opt in
	u)
		echo "提供了選項 u 和 參數: $OPTARG" ;;
	a)
		echo "提供了選項 a" ;;
	h)
		echo "提供了選項 h" ;;
	*)
		;;
   esac
done
