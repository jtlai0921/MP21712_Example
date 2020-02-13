#! /bin/bash
declare -i i=0 ; while ((1)); do ((i++));  touch $i.txt; done