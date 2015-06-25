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

cat $FILE_PATH | awk -F '&luw' 'BEGIN {print "[BEGIN PARSE..]" }  
{
	wordstr=substr($2, 2);
	split(wordstr, words, "#");
	channelstr=substr($3, 3);
	split($7, temp_arr, "&luctr:");
	split(temp_arr[2], temp_arr2, "&lumidcpm:");
	split(temp_arr2[1], luctrs, "#");
	times[1]=0;
	times[2]=0;
	times[3]=0;
	times[4]=0;
	times[5]=0;
	times[6]=0;
	times[7]=0;
	times[8]=0;
	times[9]=0;
	for (i in words) {
		channel=substr(channelstr, i, 1);
		times[channel]++;
		print "Line - "NR"  word:"words[i]"  channel:"channel"  luctr:"luctrs[i];
	}
} 
END {
	print "[FINISH PARSE]";
	print "[OUTPUT STATISTICS INFO]";
	for(i=1; i<10; i++) {
		print "Channel "i" show "times[i]" times";
	}
}'
