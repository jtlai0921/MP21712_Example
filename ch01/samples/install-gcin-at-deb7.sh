#! /bin/bash
apt-get update
apt-get install gcin

cat <<EOF > /etc/X11/Xsession.d/99gcin
export GTK_IM_MODULE=gcin
export XMODIFIERS=@im=gcin
export QT_IM_MODULE=gcin
gcin&
EOF

echo '請重新登入桌面！'
