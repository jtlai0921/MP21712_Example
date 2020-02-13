#! /bin/bash 
if [ $UID -eq 0 ]; then
	 echo "登入身份是 root"
else
	 echo "登入身份是一般使用者"
fi
