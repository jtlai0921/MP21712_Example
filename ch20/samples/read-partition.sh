tail -n +3 /proc/partitions | { 
while read a b size partition
do
	echo $partition 的容量：$size
done
}
