#! /bin/bash
# 尋找 /etc 目錄中最新的檔案
unset -v newfile
for f in /etc/*; do
   [ -f $f -a ! -L $f ] && [[ $f -nt $newfile ]] && newfile=$f
done
echo "最新的檔案是：$newfile"
