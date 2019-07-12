#!/bin/bash
#bluetooth1
declare -f filename="${@}"
echo $filename
usage()
{
    echo "usage: bluetooth [[[-f | --file ] [-i]] | [-h]]"
    exit 1
}


while :
do
    while read  line
    do
	echo $line" Sending"
	obexftp -b $line -B 12 -d hci0 -U NONE -p $filename
	echo $line >> sended.txt
	sed -i "/"$line"/d" sending.txt
    done < sending.txt
    sleep 0.0000000000000000000000000000000000000000000000000000000000000000000001
done
