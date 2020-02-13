#! /bin/bash
unset -v fname
declare -A newfile  # 宣告一個關聯式陣列
bkIFS=$IFS          # 備份分隔字元變數 IFS
while IFS= read -rd '' fname; do    # 讀取檔案名稱，當作索引鍵
   IFS= read -rd '' newfile[$fname] # 讀取檔案修改時間，當作值
done < <(find . -maxdepth 1 -type f -printf '%p\0%Ts\0') # <-- 用置換行程讀取檔名和檔案修改時間
IFS=$bkIFS          # 恢復 IFS
# 以下for迴圈用來顯示鍵值對應關係
for i in ${!newfile[@]}; do
	echo "$i ==> ${newfile[$i]}"
done
