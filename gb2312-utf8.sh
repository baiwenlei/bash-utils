#!/bin/bash

files=`find . -name *.java`
for file in $files
do
    printf "convert $file ... "
    dir=`dirname $file`
    iconv -f GB2312 -t UTF-8 $file > $dir/temp.java
    if [ !$? ]; then
        mv $dir/temp.java $file
        printf "done\n"
    else
        rm -f $dir/temp.java
    fi
done
