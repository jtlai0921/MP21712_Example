#! /bin/bash
# 使用 zenity 的版本
shopt -s -o nounset
declare -i p=0
SRC="src.iso"
DEST="dest.iso"
Total=$(stat -c %s $SRC)
touch $DEST
(cp -f $SRC $DEST; sync) &
{
while ((p < 100))
do
	Size=$(stat -c %s $DEST)
	p=Size*100/Total
	echo $p ; sleep 1
	echo "# 已拷貝進度為 $p%" ; sleep 1
done
} | zenity --progress \
	--width=400 --height=200 \
	--title="複製 ISO 檔" \
	--text="拷貝進度..." \
	--percentage=0