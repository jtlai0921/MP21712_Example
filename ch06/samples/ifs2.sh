#! /bin/bash
PL="root:x:0:0:root:/root:/bin/bash"
# 重新定義 IFS，要以 ‘:’ 為分隔字元
IFS=':'
# j 代表第幾個欄數
j=0
# 以迴圈分析各欄位
for i in $PL
do
	j=$((j+1))  # j 增加 1
	echo 第 $j 個欄位是 $i
done