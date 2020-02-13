#! /bin/bash

v=4.2
mkdir bashwork
cd bashwork

#wget ftp://ftp.cwru.edu/pub/bash/bash-$v.tar.gz
#wget ftp://ftp.cwru.edu/pub/bash/bash-4.2-patches/*

wget ftp://ftp.twaren.net/pub/Unix/GNU/gnu/bash/bash-$v.tar.gz
wget ftp://ftp.twaren.net/pub/Unix/GNU/gnu/bash/bash-4.2-patches/*

tar xvzf bash-$v.tar.gz
chmod 644 *.sig
rm -f *.sig bash-$v.tar.gz

cd bash-$v
for x in ../*; do
	if [ -f $x ]; then
		patch -p0 < $x
	fi
done


#需 bison (yacc)
if ! which bison > /dev/null 2>&1; then
	sudo apt-get update
	sudo apt-get install build-essential bison
fi

./configure &&
make &&
sudo make install
