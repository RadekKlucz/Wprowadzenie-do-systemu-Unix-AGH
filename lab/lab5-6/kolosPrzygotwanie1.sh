#!/bin/bash 

if (( $# > 3 )) || (( $# < 3 )); then 
    echo "Za duzo lub za malo argumentow" 
    exit 1 
elif [[ ! -f $1 ]]; then 
    echo "Argument pierwszy nie jest plikiem lub nie istnieje" 
    exit 1
elif [[ ! -d $2 ]]; then
    echo "Argument drugi nie jest katalogiem lub nie istnieje" 
    exit 1
elif [[ ! -w $2 ]]; then 
    echo "Brak uprawnien do katalogu" 
    exit 1
elif (( $3 < 0 )); then
    echo "Argument trzeci nie jest liczba naturalna" 
    exit 1
fi

for i in ; do 
    echo "Cos"
done