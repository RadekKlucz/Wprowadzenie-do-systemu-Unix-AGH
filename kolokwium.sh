#!/bin/bash

trap "echo 'Do widzenia'; exit 0" 2

uzytkownicy=("$@")

if [ ${#uzytkownicy[@]} -eq 0 ]; then
    uzytkownicy=($(users))
fi

if [ ${#uzytkownicy[@]} -eq 0 ]; then 
    echo "Brak aktualnie zalogowanych uzytkownikow do systemu."
    echo "Petla while bedzie wypisywala pustke, az ktos sie w koncu zaloguje."
fi 

while true; do
    for uzytkownik in "${uzytkownicy[@]}"; do
        if id "$uzytkownik" >/dev/null 2>&1; then
            pamiecRss=$(ps -u "$uzytkownik" -o rss= | awk '{pamiec += $1} END {print pamiec}')
            echo "$uzytkownik $pamiecRss w kB"
        else
            echo "Niepoprawny uzytkownik: $uzytkownik. Prosze wpisac poprawna nazwe uzytkownika"
            blednyUzytkownik=true
        fi
    done

    if [ "$blednyUzytkownik" = true ]; then
        exit 1
    fi
    
    sleep 3
done