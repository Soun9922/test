#!/bin/bash

echo "----Converting between the different temperature scales----"
echo "Convert celsius temp to fahrenheit"
echo "Convert fahrenheit to celsius"
echo -n "Select your choice (1-2) : "
read c

case $c in

		1)

		echo -n "Enter temp (c) :"
		read tempc
		tempf=$((($tempc*9/5)+32))
		echo "$tempc C = $tempf F"
		;;

		2)

		echo -n "Enter temp (f) :"
		read tempf
		tempc=$((($tempf-32)*5/9))
		echo "$tempf F = $tempc C"
		;;

	esac


