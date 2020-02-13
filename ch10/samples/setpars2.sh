#! /bin/bash
echo "本程式名稱: $0"
echo "共有 $# 個參數"
echo "參數值: $@"
echo "-------------"
echo '重置參數....'
set 66 88
echo "重置後參數個數: $# 個"
echo "重置後參數值: $@"
