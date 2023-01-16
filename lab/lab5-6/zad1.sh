#!/bin/bash

if (( $# == 0 )); then
    echo "ERROR: Invalid arguments"
    exit 
fi
licznik=1
while [[ $1 ]]; do
    echo "Argument $licznik to $1"
    licznik=$((licznik + 1))
    shift
done



