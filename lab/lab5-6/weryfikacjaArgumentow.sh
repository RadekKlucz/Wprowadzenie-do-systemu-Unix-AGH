#!/bin/bash

if (( $# != 1 ));then 
    echo "ERROR: Zla liczba argumentow"
    exit 
elif [[ ! -f $1 ]]; then 
    echo "ERROR: Plik nie jest reguralny"
    exit
fi
