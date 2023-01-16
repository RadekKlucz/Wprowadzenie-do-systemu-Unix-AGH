#!/bin/bash

if (( $# > 3 )); then 
    echo "Too many arguments"
    exit 1
elif (( $# < 3 )); then
    echo "Not enough arguments"
    exit 1 
fi 

if [[! -e $1 ]] || [[ ! -f $1 ]]; then
    echo "It is not a file"
    exit 1
fi

if [[! -d $3 ]]; then
    echo "It is not a directory"
    exit 1
fi 

file=$1
length=$2
directory=$3

#pobranie rozmiaru pliku
size=$(stat -c%s "$file")

#utworzenie nazwy pliku kopia
filename="$(basename -- $file)"
extension="${filename##*.}"
filename="${filename%.*}"

#petla kopiujaca plik na kawalki
i=1
offset=0
while [ $offset -lt $size ]; do
  dd if="$file" of="$directory/$filename-part-$i.$extension" bs=$length skip=$((offset/length)) count=1
  offset=$((offset+length))
  i=$((i+1))
done

