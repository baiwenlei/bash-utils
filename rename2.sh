#!/bin/bash

if test -d res 
then
    rm -rf res
fi
mkdir res

files=`find . -name *.png`
for file in $files
do
    dst=${file//[.\/]/_}
    echo "coping $file to res/$dst"
    cp $file res/$dst
done
