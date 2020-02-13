#! /bin/bash
coproc MYCO { cat dataf1; sleep 1; }
while read -u ${MYCO[0]}
do
	echo $REPLY
done
