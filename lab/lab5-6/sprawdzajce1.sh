#!/bin/bash

while true; do
    # wypisuje userow tle razy ile maja procesow
    # pozniej srotuje i zlicza liczbe wystapien unikalnych wartosci
    ps -e -o user | awk '{print $1}' | sort | uniq -c 
    currentDate=$(date)
    sleep 2
    trap 'echo "Current date is: $currentDate"; exit' 2
done