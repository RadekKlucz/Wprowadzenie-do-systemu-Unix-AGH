#!/bin/bash 

if (( $# == 0 )); then 
    read -p "Podaj sciezke do pliku passwd", path
elif (( $# > 2 )); then 
    echo "Za dużo argumentów"
    exit 1
elif (( $# < 2 )); then 
    echo "Za mało argumentów"
    exit 1
elif [[ ! -f /etc/passwd ]]; then 
    echo "Argument nie jest plikiem lub nie istnieje"
    exit 1
fi 

if [[ $2 ]]; then 
    login=$1
else
    read -p "Podaj login", login
fi
