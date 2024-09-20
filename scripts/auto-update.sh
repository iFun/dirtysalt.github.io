#!/usr/bin/env bash
# Copyright (C) dirlt

git pull
f=/tmp/mysite-auto-update.txt
cur_cmt=`git rev-parse HEAD`
last_cmt=`cat $f`
echo $cur_cmt > $f
if [ "$cur_cmt" != "$last_cmt" ]; then
    bash ./scripts/publish-html.sh
    if [ $? != 0 ]; then
        echo "failed" > $f
        exit 1
    fi
fi
cur_cmt=`git rev-parse HEAD`
echo $cur_cmt > $f
