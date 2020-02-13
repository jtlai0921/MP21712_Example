#! /bin/bash
fn=${1:?'錯誤! 請提供要刪除的目錄名稱!'}
echo '您要執行刪除目錄的指令是:'
echo "rm -Rf ~/$fn"
