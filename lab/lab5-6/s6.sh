#!/bin/bash
L=`who | cut -d' ' -f1 | sort | uniq`
for u in $L; do
	P=`ps aux | tail -n+2 | awk '{print $1" "$6}' | grep $u | cut -d' ' -f2`
	S=0
	for k in $P; do
		((S+=$k))
	done
	echo $u" "$S
done
