#! /bin/bash

# 國外
link="ftp://ftp.cwru.edu/pub/bash/bash-4.2.tar.gz"
# 國內
#link="http://ftp.twaren.net/Unix/GNU/gnu/bash/bash-4.2.tar.gz"
mkdir WORK
cd WORK
wget $link
tar xvzf bash-4.2.tar.gz 

