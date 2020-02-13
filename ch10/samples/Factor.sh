#! /bin/bash
#
# function 也可以使用遞迴功能
# 以下是數學階乘的計算, 如 5! = 5 * 4 * 3 * 2 * 1
#

function factor_in () {
	local tmp
	local tmp1

	# tmp 儲存傳入函數的整數值
	tmp="$1"

	# 若傳入的整數是 1，就顯示 1 就好，總乘積 r = 1
	if [ $tmp -eq 1 ]; then
		echo -n " 1 "
		r=1
	else
	# 若傳入值不是 1，則在這個區塊做處理
	# 以傳入 5 為例，這裡先顯示 ' 5 * ' 的字串
	# 下次若傳入 4，就會有 5 * 4 的效果出現  
		echo -n " $tmp * "
		# tmp 暫存在 tmp1 中 
		tmp1=$tmp
		# tmp 減 1 
		tmp=$(($tmp-1))
		# 遞迴叫用本函式
		factor_in $tmp
		# 計算總乘積
		r=$(($tmp1 *  $r))
	fi
}

# 檢查使用者提供的參數是否足夠
if [ $# -ne 1 ]; then
	echo "使用法: $0 正整數"
	exit 1
fi

# 顯示結果
echo
echo -n $1"! = "
factor_in $1
echo -n "= $r"
echo
