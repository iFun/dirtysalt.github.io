#!/usr/bin/env bash
# Copyright (C) dirlt

cur_cmt=`git rev-parse HEAD`
last_cmt=`cat /tmp/mysite-auto-update.txt`
echo $cur_cmt > /tmp/mysite-auto-update.txt
if [ $cur_cmt != $last_cmt ]; then
    bash ./scripts/publish.sh
fi
