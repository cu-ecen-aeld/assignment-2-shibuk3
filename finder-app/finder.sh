#!/bin/sh
filesdir="$1"
searchstr="$2"   
if [ $# -ne 2 ]
then
	echo "This require exactly two arguments"
	exit 1
elif [ ! -d $1 ]
then
	echo "The $filedir is not represent the directory of the file system"
	exit 1
fi
numberOfFiles=0
numberOfLines=0
search_files()
{
	local curr_dir="$1"
	for file in "$curr_dir"/*
	do 
		if [ -f "$file" ]
		then 
			local temp=$(grep -c "$searchstr" "$file")
			numberOfLines=$((numberOfLines+temp))
			numberOfFiles=$((numberOfFiles+1)) 
		elif [ -d "$file" ]
		then 
			search_files "$file"
		fi
	done
}

search_files "$filesdir"
echo "The number of files are $numberOfFiles and the number of matching lines are $numberOfLines"
