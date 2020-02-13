#! /bin/bash
# 使用對稱式密碼加密單一檔案
if [ $# -ne 2 ]; then
	echo "Usage: $0 password file"
	exit 1
fi
pass=$1
file=$2
[ ! -f $file ] && echo "$file 檔案不存在." && exit 2
echo $pass | gpg --batch -q --passphrase-fd 0 --cipher-algo AES256 -c $file


