#! /bin/bash
# 本程式在 Clinet 端執行，連向 HOST 主機
HOST=192.168.3.254

# 只執行一次，若下次不想重建公私鑰，請把以下這列註解掉：
ssh-keygen -b 4096

# 建立 server 端的 ~/.ssh 目錄
echo "請輸入 $USER 的登入密碼來開設 .ssh 目錄："
ssh $HOST mkdir -p '~/.ssh'

# 利用管線，把 keyfile 利用 ssh 上傳至 Server 端。
echo "請輸入 $USER 的登入密碼來建立 authorized_keys："
cat ~/.ssh/id_rsa.pub | ssh $HOST "cat >> .ssh/authorized_keys"

# 設定檔案權限
ssh $HOST chmod 700 '~/.ssh'
ssh $HOST chmod 600 '~/.ssh/*'
