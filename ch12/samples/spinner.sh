#! /bin/bash
cp test.iso . &  # 將拷貝行程丟到背景中執行
while kill -0 $! 2>/dev/null
do
   spin=('/' '-' '\' '|')
   for i in "${spin[@]}"; do
      printf '\b%s' "$i"
      sleep 0.2
   done
done
printf '\b%s' "Done"
echo
