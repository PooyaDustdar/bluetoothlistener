#!/bin/bash
while : 
do
	echo "Scanning for available bluetooth signals"
	hcitool -i hci1 scan | egrep -o "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})" > scandevices.txt
	while read  line
	do
        	if ! grep -q $line sended.txt; then
			if ! grep -q $line sending.txt; then
				echo $line >> sending.txt
				echo $line" Add To Sending"
			else
				echo $line" Sending"
			fi
		else
			echo $line" Sended"
		fi
	done < scandevices.txt
done