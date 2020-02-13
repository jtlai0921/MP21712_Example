#! /bin/bash
set -e
echo test1 | grep -e 'ttt'; echo $? | echo test2
echo final
