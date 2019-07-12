#!/bin/bash
#bluetooth1
usage()
{
    echo "usage: bluetooth [[[-f file ] [-i]] | [-h]]"
}

while [ "$1" != "" ]; do
    case $1 in  -f | --file ) shift
                                filename=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo $filename
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
