#! /bin/bash
coproc cat dataf1
while read -u ${COPROC[0]}
do
	echo $REPLY
done
