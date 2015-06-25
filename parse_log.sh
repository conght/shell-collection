#!/bin/sh

usage ()
{
	echo 'Usage :  -f <log_file>'
	#echo '                  <query> -w <warning value> -c <critical value>'
	exit
}

FILE_PATH="/Users/tanlu/Downloads/test.txt"

if [ "$1" == "-h" ]
then
	usage
fi

if [ "$1" == "-f" ] ; then
	if [ "$2" != "" ] ; then
		FILE_PATH=$2
	else
		usage
	fi
fi

cat $FILE_PATH | awk 'BEGIN {print "[BEGIN] Here can init some global params"}  {print $1","$7} END {print "[END] Here can print the statistical result"}'
