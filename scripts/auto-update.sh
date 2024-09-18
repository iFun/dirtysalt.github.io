#!/usr/bin/env bash
# Copyright (C) dirlt

git pull
f=/tmp/mysite-auto-update.txt
cur_cmt=`git rev-parse HEAD`
last_cmt=`cat $f`
echo $cur_cmt > $f
if [ "$cur_cmt" != "$last_cmt" ]; then
    bash ./scripts/publish.sh
    if [ $? != 0 ]; then
        echo "failed" > $f
    fi
fi
