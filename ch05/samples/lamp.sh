#! /bin/bash

# 安裝必要的基礎工具
apt-get install libxml2-dev
apt-get apt-get build-dep mysql-server
apt-get cmake

work_dir="build-work-dir"
mkdir -p $work_dir &&

# 解壓
tar xvzf mariadb-5.5.30.tar.gz -C $work_dir &&
tar xvzf apr-1.4.6.tar.gz -C $work_dir &&
tar xvzf apr-util-1.5.2.tar.gz -C $work_dir &&
tar xvjf pcre-8.32.tar.bz2 -C $work_dir &&
tar xvzf httpd-2.4.4.tar.gz -C $work_dir &&
tar xvjf php-5.4.14.tar.bz2 -C $work_dir &&

cd $work_dir &&

# 安裝 apr 和 apr-utils
cd apr-1.4.6 &&
./configure &&
make &&
make install && 

cd ../apr-util-1.5.2 &&
./configure --with-apr=/usr/local/apr  &&
make &&
make install &&

# 安裝 pcre
cd ../pcre-8.32 &&
./configure &&
make &&
make install &&

# 安裝 MariaDB
cd ../mariadb-5.5.30 &&
BUILD/compile-pentium-max &&
make install &&

# 設定 Apache2
echo "Configure apache ...." &&
cd  ../httpd-2.4.4 &&
./configure --with-apr=/usr/local/apr --with-pcre=/usr/local --prefix=/usr/local/apache2 --enable-so &&
make &&
make install &&

# 設定/編譯/安裝 PHP5
cd ../php-5.4.14 &&
./configure \
           --with-apxs2=/usr/local/apache2/bin/apxs \
           --with-mysql=/usr/local/mysql &&
make &&
make install &&

# 拷貝 php.ini 到 /usr/local/lib
cp -f php.ini-production /usr/local/lib/php.ini &&

cd ../ &&
rm -Rf $work_dir &&

{
echo
echo 'Done!'
echo
}