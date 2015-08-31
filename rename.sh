#!/bin/bash

files=`ls`
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in ${files}
do
    if [ -d ${file} ]
    then
        chapnum=`echo "$file" | sed -n -e 's/[^0-9]*\([0-9]*\).*/\1/p'`
        chapnum=`printf "%02d" $chapnum`
        mv $file "chapter-$chapnum"
    fi
done
IFS=$SAVEIFS
