#! /bin/bash
coproc { cat dataf1; sleep 1; }
while read -u ${COPROC[0]}
do
	echo $REPLY
done
