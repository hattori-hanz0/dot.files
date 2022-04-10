#!/usr/bin/env bash

DATA=$(date +%F-%T)

cd "$1"

git add -A && git commit -m $DATA
