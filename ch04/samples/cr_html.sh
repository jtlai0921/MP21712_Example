#! /bin/bash
for usr in /home/us[1-4]; do 
   # 開啟 html 目錄做為網頁存放空間
   htmldir="$usr/html"

   # 若目錄不存在，則開啟一個新目錄
   if [ ! -d "$htmldir" ]; then
       mkdir -p "$htmldir"
   fi

   # 產生 index.html 
   echo "您是 $usr" >  "$usr/html/index.html"

   # 改變檔案擁有者為該使用者
   chown -R "$usr.$usr" "$htmldir"
done
