#!/bin/bash

cd ~/archIso/

read -p "Enter a message: " msg

git add baseline/

git commit -m "$msg"

git push -u origin main
