#! /bin/bash
ver=4.7.4              # 更新 wordpress 版本至 4.7.4 版
DATE=$(date '+%Y%m%d') # 取得日期
updir="/home"    # 上層目錄
twodir="mywordpress"   # wordpress 的存放目錄
srcdir="$updir/$twodir"   # wordpress 的絕對路徑
DL=/root/WP            # 下載 wordpress 程式的存放路徑
srcfile="wordpress-$ver-zh_TW.zip"  # 新版的 wordpress 檔名
cd $DL                 # 進入 wordpress 程式的存放路徑
# 如果新版的 wordpress 程式不存在，就到 tw.wordpress.org 官網下載
if [ ! -f $srcfile ]; then
	wget http://tw.wordpress.org/$srcfile 
fi
rm -Rf wordpress       # 刪除上次解壓的舊版程式
unzip $srcfile  # 解壓新版的 wordpress
cd $updir              # 進入上層目錄
cp -a $twodir $twodir.save.$DATE # 備份原已安裝的 wordpress 程式
cd $srcdir                # 進入已安裝的 wordpress 目錄
rm -Rf wp-include wp-admin # 刪除舊版的兩個目錄
cp -R $DL/wordpress/wp-includes . # 拷貝成新版本
cp -R $DL/wordpress/wp-admin .    # 拷貝成新版本
cp -Rf $DL/wordpress/wp-content/* wp-content   # 拷貝成新版本
cp $DL/wordpress/*.php .  # 拷貝成新版本
echo 'Done.'              # 升級完成啦！
