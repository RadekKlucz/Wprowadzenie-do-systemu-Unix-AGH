#!/bin/bash

if (( $# != 3 )); then
    echo "ERROR: Invalid arguments for script"
    exit 1
elif [[ ! -f $1 ]] || [[ ! -r $1 ]]; then 
    echo "ERROR: File '$1' does not exist"
elif [[ ! -d $2 ]] || [[ ! -w $2 ]]; then
    echo "User does not have permission to $2"
    exit 1
elif (( $3 <= 0 )); then
    echo "Invalid number"
    exit 1
fi 

file="$1"
directory_path="$2"
num_copies="$3"

for ((i=1; i<=$3; i++)); do
  cp "$file" "$directory_path/`basename $file`-kopia-$i"
#   basename $file_path jest poleceniem, które zwraca nazwę pliku bez ścieżki. 
#   W ten sposób, jeśli plik jest w katalogu "/home/user/documents/example.txt", 
#   to polecenie  `basename /home/user/documents/example.txt zwróci "example.txt"
done
