#! /bin/bash
get_html() {  curl -s http://www.ols3.net/; }
html_file=$(get_html)   # <-- 變數 $html_file 之值，即抓取到的網頁檔內容
echo $html_file
