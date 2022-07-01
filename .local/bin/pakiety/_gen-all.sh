#!/usr/bin/env bash

ZESTAWY=$(ls -t --ignore="all.txt*" --ignore="_gen-all.sh")

ZESTAWY_ARRAY=($ZESTAWY)

rm all.txt
for ITEM in "${ZESTAWY_ARRAY[@]}"; do
	 cat $ITEM >> all.new
	 echo >> all.new
done

sort -o all.txt -u all.new
sed -i '/^$/d' all.txt
rm all.new
