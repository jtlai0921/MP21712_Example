#! /bin/bash
function pars() {
	echo "共有 $# 個參數傳入本函式"
	echo "參數值: $@"
}
pars 100 90 80 70 60
echo "本程式命令列的參數值: $@"
