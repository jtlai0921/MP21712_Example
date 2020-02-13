#! /bin/bash
#
#
#

str=()
num=1273659480
len=${#num}
for ((i=0; i<$len; i=i+1)); do
   str[$i]=${num:$i:1}
done

echo "原數: $num"
echo -n "新數: "
for ((i=$len-1; i>=0; i=i-1)); do
   echo -n ${str[$i]}
done
echo
