#! /bin/bash

# 設定版本編號及 MariaDB 安裝路徑
MariaDB_Version="mariadb-5.5.30"
apr_Version="apr-1.4.6"
apr_util_Version="apr-util-1.5.2"
pcre_Version="pcre-8.32"
Apache2_Version="httpd-2.4.4"
PHP5_Version="php-5.4.14"
MariaDB_HOME="/usr/local/mysql"

# 安裝必要的基礎工具
apt-get install libxml2-dev
apt-get apt-get build-dep mysql-server
apt-get cmake

# 建立工作目錄，在該目錄中做編譯的動作
work_dir="build-work-dir"
mkdir -p $work_dir &&

# 解壓
tar xvzf $MariaDB_Version.tar.gz -C $work_dir &&
tar xvzf $apr_Version.tar.gz -C $work_dir &&
tar xvzf $aprutil_Version.tar.gz -C $work_dir &&
tar xvjf $pcre_Version.tar.bz2 -C $work_dir &&
tar xvzf $Apache2_Version.tar.gz -C $work_dir &&
tar xvjf $PHP5_Version.tar.bz2 -C $work_dir &&

# 進入工作目錄
cd $work_dir &&

# 安裝 apr 和 apr-utils
cd $apr_Version &&
./configure &&
make &&
make install && 

cd ../$aprutil_Version &&
./configure --with-apr=/usr/local/apr  &&
make &&
make install &&

# 安裝 pcre
cd ../$pcre_Version &&
./configure &&
make &&
make install &&

# 安裝 MariaDB
cd ../$MariaDB_Version &&
BUILD/compile-pentium-max &&
make install &&

# 設定/編譯/安裝 Apache2
echo "Configure apache ...." &&
cd  ../$Apache2_Version &&
./configure --with-apr=/usr/local/apr --with-pcre=/usr/local --prefix=/usr/local/apache2 --enable-so &&
make &&
make install &&

# 設定/編譯/安裝 PHP5
cd ../$PHP5_Version &&
./configure \
	--with-apxs2=/usr/local/apache2/bin/apxs \
	--with-mysql=$MariaDB_HOME &&
make &&
make install &&

# 拷貝 php.ini 到 /usr/local/lib
cp -f php.ini-production /usr/local/lib/php.ini &&

cd ../ &&

# 刪除工作目錄
rm -Rf $work_dir &&

# 完成了喔！
{
echo
echo 'Done!'
echo
}
