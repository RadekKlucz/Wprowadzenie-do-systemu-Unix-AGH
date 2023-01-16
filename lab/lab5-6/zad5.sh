#!/bin/bash

if [[ $# == 0 ]]; then
    echo "Script without argument"
    read -p "Enter the UDI " inputUid
else
    inputUid=$@
fi 


for i in $inputUid; do
    awk -F: '$3 == '$i' { print $5 }' /etc/passwd
done 