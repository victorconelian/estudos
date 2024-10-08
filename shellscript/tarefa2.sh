#!/bin/bash

for ((i=0;i<11;i++))
do
	echo $i
	resto=$(( $i%2 ))
	[ $resto -eq 0 ] && echo "$i eh divisivel por 2"
done
