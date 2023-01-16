#!/bin/bash

if (( $# == 0 )); then
    echo "Not enough arguments"
    exit 1
fi 

if [[ ! -f $1 ]]; then 
    echo "First argument is not a file"
    exit 1
elif [[ ! -d $2 ]]; then
    echo "Second argument is not a file"
    exit 1
# elif [[ ! -r $1 ]] || [[ ! -r $2 ]]; then
#     echo "You do not have permission to read this file or directory"
#     exit 1
elif [[ ! -w $1 ]] || [[ ! -w $2 ]]; then
    echo "You do not have permission to write this file or directory"
    exit 1
# elif [[ ! -x $1 ]] || [[ ! -x $2 ]]; then
#     echo "You do not have permission to execute this file or directory"
#     exit 1
else 
    cp $1 "$2/$1-kopia-spr3"
    echo "File has been copied to directory" 
fi 


# # Pobieranie argumentów z linii poleceń
# source_file=$1
# destination_directory=$2

# # Sprawdzanie, czy plik źródłowy istnieje
# if [ -f "$source_file" ]; then
#     # Sprawdzanie, czy katalog docelowy istnieje
#     if [ -d "$destination_directory" ]; then
#         # Sprawdzanie, czy jest dostęp do zapisu w katalogu docelowym
#         if [ -w "$destination_directory" ]; then
#             # Kopiowanie pliku do katalogu docelowego
#             cp "$source_file" "$destination_directory"
#             echo "Plik $source_file został skopiowany do katalogu $destination_directory."
#         else
#             echo "Brak dostępu do zapisu w katalogu $destination_directory."
#         fi
#     else
#         echo "Katalog docelowy $destination_directory nie istnieje."
#     fi
# else
#     echo "Plik źródłowy $source_file nie istnieje."
# fi
