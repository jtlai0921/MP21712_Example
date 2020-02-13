#! /bin/bash
# 用法: ./a2h.sh 字串

a2h() {
    printf "$@" | hexdump -v -e '/1 "%02X"'
}

a2h $@
