#!/bin/bash

thefile=""

if (( $# == 0 )) ; then
   echo "Nie podano argumentu, podaj nazwe pliku: "
   read thefile
elif (( $# == 1 )) ; then
   thefile=$1
else
  echo "Nieprawidlowa liczba argumentow."
  exit 1
fi


if [[ ! -e $thefile ]] ; then
   echo "wskazany plik $thefile nie istnieje"
   exit 2
fi

echo -n "plik: $thefile, moje uprawnienia do tego pliku: "

if [[ -r $thefile ]] ; then
  echo -n "READ "
fi

if [[ -w $thefile ]] ; then
  echo -n "WRITE "
fi

if [[ -x $thefile ]] ; then
  echo -n "EXECUTE "
fi


echo ""

exit 0
