# Rozwiązania do zadan ze skryptów 5 i 6

# Kolos 

[Treść](./kolos.md)

## Toretycznie rzeczy z skryptu 5 

### Tworzenie aliasów 

```bash
alias nazwa=polecenie
```
### Wyświetlanie aktalnie istniejących zmiennych 

```bash
set
```

### Wyswietlenie wskazanej zmiennej 

```bash
echo $zmienna
```

### Usuwanie zmiennej 
```bash
unset zmienna (bez $)
```

W ten sposób stworzone zmienne dostępne są w aktualnym środowisku,
nie zostaną one jednak przekazane do środowiska potomnego

### Do eksportu zmiennej i wyswietlania exportowanych zmiennych
```bash
# do eksportowania
export 

# do wyświetlania 
env
```

### Zablokowanie możliwości edycji zmiennej o danej nazwie 

```bash
readonly
```
Sam atrybut „tylko do odczytu” domyślnie nie jest eksportowany do środwisk potomnych, można to zmienić poprzez wydanie komendy:

```bash 
export readonly ZMIENNA=wartosc
```

### Składnia przekierowania

Typowym przekierowaniem, pozwalającym na przekazanie zawartości
pliku tekstowego na standardowe wejście programu, jest:
```bash
program < plik.txt
```

Można jednak skorzystać z innych metod. Poniższa składnia pozwala na
przesłanie wielowierszowego wejścia do programu (DELIM oznacza początek i koniec bloku tekstu i jest oznaczeniem deklarowanym w pierwszej
linii po <<):

```bash
program << DELIM
Tutaj
jest
wiele
linii
DELIM
```

### Składnia: brace expansion

Do utworzenia ciągu z postępem jeden możemy skorzystać z wyrażenia:

```bash
{1..20}

# lub 
echo {1..20..3}

# lub 
 {19..1..3}
```

## Toretycznie rzeczy z skryptu 6

### Wybór interpretera 

 Ustawienie dyrektywy1 #!/bin/bash na początku pliku tekstowego
z programem do wykonania pozwala wskazać ścieżkę interpretera,
w tym przypadku Bash.

Uruchomienie skryptu poprzez przekazanie ścieżki do niego do komendy interpretera. Na przykład: bash ./script.sh spowoduje
wykonanie skryptu za pomocą interpretera Bash.

Ta forma może być przydatna do szybkiego debugowania skryptów
poprzez użycie parametru -x: bash -x ./script.sh. Powoduje to
wyświetlenie każdej linii z wykonanym podstawieniem zmiennych
przed jej wykonaniem. Jest to równoznaczne z użyciem set -x na
początku skryptu.

### Instrukcje warunkowe Bash

```bash
if warunek_1; then
instrukcje_jesli_1
elif warunek_2 ; then
instrukcje_jesli_2_i_nie_1
else
instrukcje_jesli_nie_2_i_nie_1
fi
```

### Pętle 
```bash
for ZMIENNA_ITERACYJNA in LISTA
do
lista_instrukcji
done
```

```bash
for (( WART_POCZATKOWA ; WARUNEK_KONCA ; ZMIANA ))
do
lista_instrukcji
done
```
```bash
while TEST
do
lista_instrukcji
done
```
W przypadku until zawartość pętli wykonuje się, dopóki instrukcja
warunkowa jest fałszywa.
```bash
until TEST_KONCA
do
lista_instrukcji
done
```

### Wyrażenia arytmetyczne 

```bash
echo $(( 5 + 2 ))
```


# Skrypt 5

## Zadanie 1

 Jeśli zmienna noclobber jest ustawiona i ma wartość "1", oznacza to, że mechanizmy przekierowywania strumieni danych (operatory >, >>, >|) nie będą nadpisywać istniejących plików. Jeśli zmienna ta jest ustawiona na "0", to mechnizmy przekierowywania strumieni danych będą nadpisywać pliki.

## Zadanie 2

Zapisywanie do plików odpowiednio za pomocą:

```bash
./wejscie.out > std.txt 2> err.txt
```

Do zapisania obu kominikatów razem: 
```bash
./wejscie.out &> razem.txt
```

Alternatywa:
```bash
./wejscie.out > razem.txt 2>&1
```
W tym przypadku operator 2>&1 oznacza, że dane z strumienia błędów są przekierowywane do tego samego pliku, do którego przekierowywane są dane z strumienia standardowego.

## Zadanie 3

Aby sprawdzić ile ostatnio wydanych komend jest pamiętanych w shellu, należy użyć komendy:

```bash
set -o
```

 Opcja ta wyświetli wszystkie ustawienia shella, w tym również zmienną środowiskową "HISTSIZE", która odpowiada za ilość pamiętanych komend.

Do sprawdzania ostatnio wydanych komend:
```bash
history 
```

Zmiana zmiennej środowiskowej na 20000:
```bash
export HSITSIZE=20000

# lub
set -o HISTSIZE=20000

# lub
echo export HISTSIZE=20000 >> ~/.bashrc
```
Należy pamiętać, że zmiana ta będzie tylko działać dla bieżącej sesji, aby była trwała należy ją dodać do pliku .bashrc

## Zadanie 4

```bash
set -o | grep HISTFILE
```

Aby wykonać raz jeszcze ostatnie polecenie rozpoczynające się od konkretnego znaku, należy użyć składni "!polecenie", gdzie polecenie jest początkiem interesującego nas polecenia z historii:

```bash
!polecenie
```
Aby wykonać polecenie o konkretnym numerze należy użyć składni "!numer", gdzie numer jest numerem interesującego nas polecenia z historii:

```bash
!numer
```

## Zadanie 5

Zmienna środowiskowa TMOUT oznacza dopuszczalny czas pozostawienia terminala w bezczynności, po upływie którego system automatycznie zrywa sesję i odłącza użytkownika od systemu.
Aby sprawdzić działanie zmiennej TMOUT, należy uruchomić interpreter interaktywny, np. powłokę Bash i użyć polecenia: 

```bash
echo $TMOUT
```

Czas bezczynności podawany jest w sekundach.

Aby ustawić wartość zmiennej TMOUT na np. 2 minuty należy wykonać polecenie:

```bash
export TMOUT=120
```

## Zadanie 6

Zmienna środowiskowa IGNOREEOF, jeśli jest ustawiona (poleceniem export IGNOREEOF), zapobiega
kończeniu pracy interpretera poleceń (wylogowywaniu się) przez naciśnięcie kombinacji klawiszy Ctrl-d. Niestety, pięciokrotne naciśnięcie
Ctrl-d powoduje odłączenie użytkownika od systemu. Nadanie zmiennej wartości powoduje, że po tylukrotnym, ile wynosi wartość zmiennej,
naciśnięciu Ctrl-d użytkownik zostanie od systemu odłączony

## Zadanie 7

Zmienna środowiskowa PATH przechowuje ścieżki dostępu do katalogów, w których interpreter poszukuje programów do wykonania. Ze
względów bezpieczeństwa nie ma w niej katalogu bieżącego.

Należy użyć polecenia:

```bash
export PATH=$PATH:.
```

Jest to dodanie do zmiennej PATH ścieżki dostępu do katalogu bieżącego (.) poprzez wykorzystanie operatora ":", co oznacza, że nowa ścieżka jest dopisywana na końcu istniejących ścieżek w tej zmiennej.

## Zadanie 8

Aby sprawdzić wartości zmiennych środowiskowych PS1 i PS2, należy uruchomić powłokę Bash i użyć polecenia "echo $PS1" oraz "echo $PS2"

Aby ustawić wartość zmiennej PS1 tak, aby znak zachęty zawierał informacje o nazwie użytkownika, nazwie hosta, czasie w formacie 24-godzinnym oraz ścieżki dostępu do bieżącego katalogu, należy użyć polecenia "export" lub "set" i składni specjalnych dostępnych dla tej zmiennej.

```bash
export PS1='\u@\h \t \w $ '

#  druga zmienna 
export PS2='<'
```

## Zadanie 9

Dodanie własnego aliasu pokazanie wyżej. Liste aliasów sprawdzamy wpisując "alias" 

Jeśli pojawiają się pliki bez kolorów, prawdopodobnie jest to spowodowane tym, że program "less" nie obsługuje kolorowania. Aby alias działał poprawnie, należy zmienić jego postać na np:

```bash
alias ll='ls -al --color=always'
# lub
alias ll='ls -al --color=always | more'
# lub
alias ll='ls -al --color=always | grep --color=always'
```

## Zadanie 10

Aby wprowadzone w środowisku interpretera poleceń zmiany były
aktywne, należy je zapisać w odpowiednich plikach konfiguracyjnych,
różnych dla różnych rodzajów interpretera (logujący, interaktywny).

Aby zmieniony znaczek zachęty PS1 był zdefiniowany tylko w interpreterze logującym, należy dodać go do pliku /etc/bash.bashrc lub ~/.bash_profile

```bash
echo export PS1='\u@\h \t \w $ ' >> /etc/bash.bashrc
```

Aby alias obowiązywał we wszystkich interpreterach, należy dodać go do pliku ~/.bashrc

```bash
echo alias ll='ls -al --color=always | less' >> ~/.bashrc
```

Aby zmienne IGNOREEOF oraz TMOUT były zdefiniowane tylko w interpreterze interaktywnym, należy dodać je do pliku ~/.bashrc

```bash
echo export IGNOREEOF=5 >> ~/.bashrc
echo export TMOUT=600 >> ~/.bashrc
```

Aby zmodyfikować wartość zmiennej PATH tak, aby zawierała ona ścieżkę dostępu do katalogu bieżącego, a nowa wartość zmiennej była dostępna w interpreterze logującym i interaktywnym, należy dodać ją do pliku /etc/bash.bashrc oraz ~/.bashrc

```bash
echo export PATH=$PATH:. >> /etc/bash.bashrc
echo export PATH=$PATH:. >> ~/.bashrc
```

Aby w trakcie odłączania się od systemu, ekran był czyszczony, należy dodać polecenie "clear" do pliku ~/.bash_logout

```bash
echo clear >> ~/.bash_logout
```

# Skrypt 6 

## Skrypty

### Zadanie 1

[Zad1](./zad1.sh)

Jeśli uruchomisz skrypt poprzez polecenie bash -vx skrypt.sh, zostaną wyświetlone komunikaty "debugowania" skryptu. Opcja -v oznacza "verbose" czyli szczegółowe komunikaty, a opcja -x oznacza "trace", czyli komunikaty dotyczące przebiegu działania skryptu.
Można zauważyć komunikaty dotyczące każdego polecenia w skrypcie, wraz z jego wynikiem, oraz informacje o zmiennych i ich wartościach.

Zauważysz również, że przed każdym poleceniem zostanie wyświetlony + symbol, który informuje cię, że to polecenie jest wykonywane.

Komunikaty te pozwolą ci na śledzenie i debugowanie skryptu, poznać jakie są wartości zmiennych i jakie polecenia są wykonywane, a także pomogą w identyfikacji błędów w skrypcie.

### Zadanie 2

[Zad2](./zad2.sh)

### Zadanie 3

[Zad3](./zad3.sh)

### Zadanie 4

[Zad4](./zad4.sh)

### Zadanie 5 

[Zadanie5](./zad5.sh)

### Zadanie 6

[Zadanie6](./zad6.sh)

### Zadanie 7

[Zadanie7](./zad7.sh)

### Zadanie 8

[Zadanie8](./zad8.sh)

### Sprawdzające 1 

[1](./sprawdzajce1.sh)

### Sprawdzające 2

[2](./sprawdzajace2.sh)

### Sprawdzające 3 

[3](./sprawdzajace3.sh)

