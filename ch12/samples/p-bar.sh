#! /bin/bash
cp test.iso . &  # 將拷貝行程丟到背景中執行
k=1  # 動態列的字元位置，最左邊為 column 1。
while kill -0 $! 2>/dev/null
do
  pbar=('-' '=' '+' '*' '#') 
  for i in "${pbar[@]}"
  do
	((k++))
    printf "%${k}b\r" "$i"
    sleep 0.2
	if ((k>=10)); then
		k=1
	fi
  done
done
