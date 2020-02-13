#! /bin/bash
# 變數要先宣告後才能使用
shopt -s -o nounset

#
# 宣告區
#

# MySQL/MariaDB Server 的管理帳密
# 管理帳號
USER="root"
# 資料庫密碼
PASSWD="m123456"   # 請自訂並修改之
# 欲連線的資料庫主機
HOST="localhost"
# mysql client 的檔案路徑
MYSQL=$(which mysql)
# mysqldump 的檔案路徑
MYSQLDUMP=$(which mysqldump)
# gzip 壓縮程式的檔案路徑
GZIP=$(which gzip)

# 取得日期和時間
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H-%M-%S")

# 備份檔的存放目錄位置
BKDIR=~/tmp/bkdir/mysql/$DATE

#
# 主程式區
#

# 開設存放備份檔的目錄
[ ! -d "$BKDIR" ] && mkdir -p "$BKDIR"

# 取得目前所有資料庫的列表名稱 
DBLIST=$($MYSQL -u $USER -h $HOST -p$PASSWD -Bse 'show databases;')

# 把每個資料庫 dump 出來，用 gzip 壓縮，存入備份目錄中
for db in $DBLIST
do
	TMP=$BKDIR/$db-$DATE-$TIME.gz
	$MYSQLDUMP --single-transaction -u $USER -h $HOST -p$PASSWD $db | $GZIP -9 > $TMP
	md5sum $TMP > $TMP.md5
done

