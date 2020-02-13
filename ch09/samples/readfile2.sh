#! /bin/bash
IFS=':'
while read f1 f2 f3 f4 f5 f6 f7
do
	echo "帳號: $f1，login shell 是: $f7"
done < "/etc/passwd"
