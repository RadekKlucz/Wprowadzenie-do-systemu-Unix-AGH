#!/bin/bash

if [[ $# == 0 ]]; then
    read -p "Enter a file name", file
else
    file=$1
fi

# Sprawdź, czy plik istnieje i czy jest plikiem
if [[ ! -f $file ]] || [[ ! -e $file ]]; then 
    echo "Argument is not a file"
    exit 1
elif [[ $# > 1 ]]; then
    echo "Too many arguments"
    exit 1
fi 

echo "Your permmission: $(ls -l $file | awk '{print $1}')"

if [[ -r $file ]]; then 
    echo "You can read this file"
else
    echo "You can not read this file"    
fi

if [[ -w $file ]]; then
    echo "You can save this file"
else
    echo "You can not save this file"
fi 

if [[ -x $file ]]; then
    echo "You can execute this file"
else
    echo "You can not execute this file"
fi 