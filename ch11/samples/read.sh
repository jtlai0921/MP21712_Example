#! /bin/bash
echo Hello > test.txt
exec 6<>test.txt
read <&6  # 此效果同 read -u 6
echo $REPLY
exec 6<&-