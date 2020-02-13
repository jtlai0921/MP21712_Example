#! /bin/bash
read -p "請輸入一個字元: " ch
case $ch in
	[0-9]) echo "您輸入的是數字 $ch" ;;&
	[[:lower:]]) echo "您輸入的是小寫 $ch" ;;&
	[[:upper:]]) echo "您輸入的是大寫 $ch" ;;&
	[a-h]) echo "您輸入的 $ch 介於 a ~ h 的字元範圍中" ;&
	[Aa]) echo "您輸入的 $ch 一定是 A 或 a 其中之一" ;;
	*) echo "有輸入就可以了." ;;
esac