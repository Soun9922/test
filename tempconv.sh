#!/bin/bash

echo "----Converting between the different temperature scales----"
echo "Convert celsius temp to fahrenheit"
echo "Convert fahrenheit to celsius"
echo -n "Select your choice (1-2) : "
read c

if [ $c -eq 1 ]
then
		echo -n "Enter temp (c) :"
		read tempc
		tempf=$((($tempc*9/5)+32))
		echo "$tempc C = $tempf F"

	elif [ $c -eq 2 ]
	then
		echo -n "Enter temp (f) :"
	read tempf
	tempc=$((($tempf-32)*5/9))
	echo "$tempf F = $tempc C"
else
	echo "Please select 1 or 2 only"
	exit 1
fi
