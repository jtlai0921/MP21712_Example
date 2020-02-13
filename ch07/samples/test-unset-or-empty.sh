#! /bin/bash

# 假設 var 是待測變數，r 是測試結果
r=${var-'unset'} && [ "$r" != 'unset' ] && r=empty
echo $r
