#!/bin/bash

cd ~/archIso/

read -p "Enter a message: " msg

git add baseline/

git commit -m "$msg"

git subtree pull --prefix=baseline/airootfs/etc/skel https://github.com/vugtsqsvgv/Dot-Files main

git commit -m "$msg"

git push -u origin main
