#!/bin/bash

if (( $# == 0 )); then 
    path=$(pwd)
elif (($# > 1)); then 
    echo "Za dużo argumentów"
    exit 1
elif [[ ! -d $1 ]]; then 
    echo "Argument nie jest katalogiem lub nie istnieje"
    exit 1
elif [[ ! -r $1 ]]; then 
    echo "Brak uprawnień do katalogu"
    exit 1
else 
    path=$1
fi 

prawo="Ma prawo do wykonania"

ls -lh $path | awk '{print $9 " " $3 " " $5}' 
exit 0

