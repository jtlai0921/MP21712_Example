#! /bin/bash
# 執行前，請先確定你的主機中有 gawk: /usr/bin/gawk
# gawk 安裝法: apt-get update; apt-get install gawk
shopt -s -o nounset

ACTfile=${1:?'錯誤! 請提供帳號檔!'}
[ ! -f "$ACTfile" ] && echo "帳號檔 $ACTfile 不存在." && exit 1

declare -i okact=0
act=''
password=''

#
# 函式區
#

create_homepage() {
	U=${1:?'錯誤! 請提供帳號!'}
	HPdir="/home/$U/public_html"
	Idx="$HPdir/index.html"
	mkdir -p $HPdir
	chmod 755 $HPdir
	cat <<EOF > $Idx
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>$U 的首頁</title>
</head>
<body bgcolor="#FFFFFF">
<div align="center">
<h1>$U 的首頁</h1>
</div>
</head>
</html>
EOF

	chown -R $U.$U /home/$U
}

#
# 主程式區
#
while read act password 
do
	adduser --quiet --disabled-password --gecos '' $act
	if [ $? -eq 0 ]; then
		echo "$act:$password" | chpasswd
		create_homepage $act
		((okact++))
		echo "帳號 $act 建立完成 ...."
	fi
done < <(awk 'BEGIN{FS=":"} /\w:\w/ {print $1, $2}' $ACTfile)

echo "共建立了 $okact 個帳號."

