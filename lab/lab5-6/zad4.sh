#!/bin/bash

while true; do
    sleep 1 
    echo "Liczba procesow w systemie to $(ps -A | wc -l)"
    sleep 3 
done 