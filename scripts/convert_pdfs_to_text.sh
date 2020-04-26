#!/bin/bash
let counter=0
for file in $(find $1 | grep pdf | sort)
do
  if [ -f $file ]
  then
    echo $file
    # Parse filename
    filename="${file##*/}"
    filename_no_ext="${filename%.pdf}"
    
    # Do conversion
    pdftotext $file -nopgbrk $2/$filename_no_ext.txt

    let counter++
  fi
done
echo "Converted $counter files"
