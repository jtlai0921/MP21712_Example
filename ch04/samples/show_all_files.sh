#! /bin/bash
shopt -s nullglob dotglob
files=(*)    # <-- 抓取工作目錄中的檔案名稱
for f in ${files[@]}; do
   echo $f
done
