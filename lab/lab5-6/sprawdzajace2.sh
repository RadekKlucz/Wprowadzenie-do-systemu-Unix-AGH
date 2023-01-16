#!/bin/bash

if [[ $# -eq 0 ]]; then 
    echo "Incorrect number of arguments"
    exit 1
fi

for i in "$@"; do
    if [[ -d $i ]]; then
        numberOfFiles=$(find $i -type f | wc -l)
        echo "Number of files: $numberOfFiles"
    else 
        echo "Directory: $i does not exist"
    fi
done 
