#! /bin/bash
HOST=192.168.3.254
ssh-keygen -b 4096
ssh-copy-id $HOST
