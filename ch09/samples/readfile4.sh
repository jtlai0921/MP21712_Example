#! /bin/bash
rfile="test.txt"
while IFS= read -r line; do
    printf '%s\n' "$line"
done < "$rfile"     # 轉向輸入，交由 read 讀取每一列
