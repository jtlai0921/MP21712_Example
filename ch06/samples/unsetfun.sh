#! /bin/bash
function show_name() {
	echo "今個兒是 $1，您 $2 大大，來自 $3"
}
unset -f show_name
name="$1"
ip="192.168.1.1"
today=`date +%F`
if [ $# != 1 ]; then
	echo "Usage: ./$0 [使用者名稱]"
	exit
fi
show_name "$today" "$name" "$ip"
