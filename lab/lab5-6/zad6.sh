#!/bin/bash

for item in *; do
    if [[ -d "$item" ]]; then 
        echo "$item directory"
    elif [[ -f "$item" ]]; then 
        permissions=$(ls -ld "$item" | awk '{print $1}')
        echo "$item: regural file, owner permissions: $permissions"
    fi
done


# Ten skrypt używa pętli for, aby przejść przez wszystkie elementy 
# w bieżącym katalogu. Dla każdego elementu, skrypt sprawdza, 
# czy jest to katalog czy plik regularny, używając polecenia [ -d "$item" ] 
# dla katalogów i [ -f "$item" ] dla plików regularnych. 
# Jeśli element jest katalogiem, skrypt wypisuje "item: directory", 
# jeśli jest to plik regularny, skrypt używa polecenia 
# ls -ld "$item" | awk '{print $1}' aby wyciągnąć prawa dostępu dla 
# właściciela i wypisuje "item: regular file, owner permissions: $permissions"