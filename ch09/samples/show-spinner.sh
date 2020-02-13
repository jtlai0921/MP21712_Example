#! /bin/bash
while :; do
  spin=('/' '-' '\' '|')
  for i in "${spin[@]}"; do
    printf '\b%s' "$i"
    sleep 0.2
  done
done
