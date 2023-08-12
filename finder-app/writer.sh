#!/bin/bash
writefile="$1"
writestr="$2"
if [ $# -ne 2 ]
then 
	echo "Require two arguments"
	exit 1
else
	dirpath="$(dirname "$writefile")"
	mkdir -p "$dirpath"
	echo "$writestr" > "$writefile"
fi
if [ ! -f $writefile ]
then
	echo "file is not created"
	exit 1
fi
