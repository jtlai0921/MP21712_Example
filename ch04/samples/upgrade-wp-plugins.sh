#! /bin/bash
DIR="mywp1 mywp2"
pl_DIR="/root/WP/"
plugin="akismet"
ver=3.3.2
for d in $DIR
do
	cd /home/$d/wp-content/plugins
	if [ -d $plugin ]; then
		rm -Rf $plugin
	fi
	if [ -f $plugin.*.zip ]; then
		rm $plugin.*.zip
	fi
	unzip $pl_DIR/$plugin.$ver.zip
done

