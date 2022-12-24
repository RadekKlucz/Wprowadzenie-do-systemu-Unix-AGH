
#!/bin/bash
if [[ $# != 3 ]]; then
 echo "Uzycie: ./copyscriph.sh plik katalog ile_razy"
 exit 1
fi
if [[ ( ! -f $1 ) || ( ! -r $1 ) ]]; then
 echo "Brak uprawnien do odczytu pliku"
 exit 2
fi
if [[ ( ! -d $2 ) || ( ! -w $2 ) ]]; then
 echo "Brak uprawnien do zapisu do katalogu"
 exit 3
fi
if (( $3 <= 0 )); then
 echo "Niewlasciwa liczba kopiowan"
 exit 4
fi
i=1
PLIK=$( echo $1 | awk -F'/' '{ print $NF }' )
while (( $i <= $3 ))
do
 NAZWA=$PLIK-kopia-$i
 cp $1 $2/$NAZWA
 i=$(( i + 1 ))
done

