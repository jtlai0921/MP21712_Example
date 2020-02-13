#! /bin/bash
SRC=/home/jack   # 欲備份的目錄上層
BKDIR=myfile     # 欲備份的目錄
DATE=$(date +"%Y-%m-%d")   # 取得日期和時間
TIME=$(date +"%H-%M-%S")
BKFILE="myfiles-BK-$DATE-$TIME.rar" # 備份檔名
DIR=/sda3/jack/myfiles-SPLIT  # 最終存放備份檔和分割檔的目的區
pass="YourPassword" # 加密用的密碼，請自訂
SIZE="50MB" # 分割檔案的大小
cd $SRC && \
echo '備份中...' && \
rar a -p$pass $BKFILE $BKDIR > /dev/null 2>&1 && \   # 用 rar 加密壓縮欲備份的目錄
echo '檔案分割中...' && \
split -b $SIZE $BKFILE && \   # 用 split 把壓縮檔切成小檔，以利搬移
echo '建立 md5sum...' && \   
md5sum $BKFILE > $BKFILE.md5 && \  # 建立 md5 檢核碼
echo '回復測試...' && \
rm $BKFILE && \
cat x?? > $BKFILE && \   # 將分割檔組合回來
md5sum -c --quiet $BKFILE.md5  # 檢查組合回來的壓縮檔是否有誤？
if [ $? -eq 0 ]; then   # 若一切正常，就把分割檔和壓縮檔放入目的區
	mv x* $DIR
	mv $BKFILE $DIR
	mv $BKFILE.md5 $DIR
	echo '備份完成!'
else
	echo '備份有誤!'
fi
