#! /bin/bash
# 變數要先宣告後才能使用
shopt -s -o nounset
ListIPcmd="/sbin/ifconfig"
IP=$($ListIPcmd | grep 'inet6 addr:' | grep -v '::1/128' | awk '{print $3}')
echo $IP
