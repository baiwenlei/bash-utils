#!/bin/bash

types=$@
for type in $types
do
    files=`find . -name *.$type`
    for file in $files
    do
        printf "convert $file ... "
        dir=`dirname $file`
        iconv -f GB2312 -t UTF-8 $file > ${file}.iconv
        if [ !$? ]; then
            mv ${file}.iconv $file
            printf "done\n"
        else
            rm -f ${file}.iconv
        fi
    done
done
