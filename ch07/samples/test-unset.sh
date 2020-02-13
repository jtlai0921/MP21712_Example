#! /bin/bash
unset var
r=${var-'unset'} && [ "$r" != 'unset' ] && r=empty
echo "var is $r"
