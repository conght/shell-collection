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

cat $FILE_PATH | awk -F '&luw' 'BEGIN {print "[BEGIN PARSE..]" } /* 用&luw切割一条日志记录 */ 
{
	/*切割出来之后，$2就是包含words的字符串格式如--- “:dada#dada#dada”*/
	/*$3 是包含channels的格式如-- "s:23232"*/
	/*$7 是包含luctr的*/
	wordstr=substr($2, 2); /*去掉第一个无用的字符":"*/
	split(wordstr, words, "#");/*用“#”切割，保存在数组words中*/
	channelstr=substr($3, 3);/*去掉前两个无用字符*/
	split($7, temp_arr, "&luctr:");/* 用"&luctr:" 切割 */
	split(temp_arr[2], temp_arr2, "&lumidcpm:");/*用&lumidcpm: 做切割，最终切割出的第一项就是要解析的luctr数据*/
	split(temp_arr2[1], luctrs, "#");/* 用“#” 分割 */
	/* 记录1-9 channel号出现的次数 */
	times[1]=0;
	times[2]=0;
	times[3]=0;
	times[4]=0;
	times[5]=0;
	times[6]=0;
	times[7]=0;
	times[8]=0;
	times[9]=0;
	for (i in words) {/*遍历关键字，index = i*/
		channel=substr(channelstr, i, 1);/*取出对应的channel号*/ 
		times[channel]++;/*channel出现次数+1*/
		print "Line - "NR"  word:"words[i]"  channel:"channel"  luctr:"luctrs[i];/*输出每个关键字及其对应的channel和luctr*/
	}
} 
END {
	print "[FINISH PARSE]";
	print "[OUTPUT STATISTICS INFO]";
	for(i=1; i<10; i++) {
		print "Channel "i" show "times[i]" times";
	}
}'
