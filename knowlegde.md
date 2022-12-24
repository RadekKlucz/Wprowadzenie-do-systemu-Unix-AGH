# Przydatne rzeczy

- Ctrl + D - dokonczenie procesu, wiecej danych juz nie bedzie 
- Ctrl + C - zakonczenie procesu 
- Ctrl + Z - zastopowanie procesu 
- CTRL + L is a keyboard shortcut to clear the screen in the Bash shell
- \HOME - zmienna srodowiskowa 

-----------------

```bash
grep bash 
```
Dolar na koncu oznacza ze slowo bash ma byc ostatnie

-----------------

## WYRAŻENIA REGULARNE
```bash
 man grep 
 ```

 Opis wyrazen regularnych 

 -----------------

## WSL
```bash
explorer.exe . & 
```
Copy file from WSL to Windows, gdzie **.** oznacza katalog w bieżący

-----------------

```bash
nautilus &
```
Open WLS Linux windows

-----------------

Connection with Bastion (not all commands) and shell (all commands):
```bash 
ssh bastion.ii.agh.edu.pl -l mylogin
```
or:
```bash 
ssh mylog@bastion.ii.agh.edu.pl
```


# OPIS NIEKTORYCH KOMEND 
```bash
man man
```

Display documentation about man command 

-----------------
```bash
man 1 passwd
```
First page of passwd's documentation

-----------------
```bash
apropos passwd, apropos passwd | more 
```

List of all pages about the passwd command in man,

-----------------
```bash
whatis passwd 
```

Brief description about command

**EXAMPLE:**
```bash
whatis ls who rm
```
OUTPUT:
| | |
|------------|-----------------------|
| ls (1)     |          - list directory contents |
| who (1)     |         - show who is logged on |
| rm (1)     |          - remove files or directories |

```bash
catman  
```
-----------------
```bash
cat 
```
Concatenate files and print on the standard output

-----------------

```bash
less
```
Print lines from a file 

-----------------

```bash
head -n 2 
```
Output the first part of files, the first two lines

-----------------

```bash
tail -n 3 
```
Output the last part of files, the last three lines 

-----------------

```bash
wc -l 
```
Do liczenia lini w tym przypadku (slow i innych tez) 
   -  -w <- slowa 
   -  -c <- znaki

-----------------
```bash
head -n 5 [file] | tail -1 
```
Read specified line of file 

-----------------
```bash
uniq 
```
Report or omit repeated lines // omit - omiń
-	-c <- ilosc wystapien lini 
-	-d <- wypisuje powtarzajace sie linie 
-	-u <- wypisuje tylko niepowtarzajace sie linie  

-----------------

```bash
cal 
```
Display a calendar and the date of Easter

-----------------

```bash
bc 
```
Calculator 

-----------------

```bash
 pwd 
 ```
Print name of current/working directory 

-----------------

```bash
 echo 
 ```
 Display a line of text 

 -----------------
 ```bash
 echo HOME 
 ```
 Display the variable of HOME

 -----------------

 ```bash
 last 
 ```
 Show a listing of last logged in users 

 -----------------

 ```bash
 last -f [file] 
 ```
 Show a list of users who used this file 

 -----------------

```bash
 who 
 ```
 Show who is logged on 

 -----------------

 ```bash
 w 
 ```
 Show who is logged on and what they are doing

 -----------------

 ```bash
 cd .. 
#  or 
cd -
```
-----------------
```bash
 ls 
 ```
 Wypisuje zawartosc aktualnego katalogu lub podanego w argumencie;	
-	-a - wypisuje rowniez pliki zaczynajace sie od kropki;
-	-d - operuje na podanym katalogu zamiast jego zawartosci;
-	-i - wypisuje i-wezly plikow;
-	-l - dluzszy listing z informacjami;

-----------------
```bash
 tree 
 ```
 Display the contents of a directory in a tree hierarchy format, options: 
 - -a (all), 
 - -d (directory)



# OPIS PLIKU /etc/passwd
 Podstawowy plik konfiguracyjny, gdzie:

- I kolumna <- nazwa uzytkownika (login name) 
- II kolumna <- kiedys zakodowane haslo, dzisiaj niekiedy informacja o stanie hasla 
- III kolumna <- UID, numer identyfikacyjny uzytkowniaka, moze sie powtarzac, 0 - root
- IV kolumna <- GID, numer grupy podstawowej, numery niepowtarzalne, decyduje o uprawnieniach 
- V kolumna <- opis uzytkownika, zalezy od admina systemu, zmiana zawartosci  chfn
- VI kolumna <- sciezka dostepu tzw. HOME, jak jeje nie ma to po zalogowaniu zaczynamy w sciezce /
- VII kolumna <- sciezka dostepu do interpretera uzytkownika, nologin - to blokada dostepu do systemu dla uzytkownika 
  

-----------------

  ```bash
 man -s5 passwd 
 ```
 Opis tego pliku w manualu, inne pliki tak tez mozna sobie odczytac  



# OPIS PLIKU /etc/group 

Opis grup, jedna linia opisuje jedną grupę, gdzie:

- I kolumna <- nazwa grupy, unikalana w systemie
- II kolumna <- kiedys haslo grupowe 
- III kolumna <- numer grupy w systemie, niepowtarzalny
- IV kolumna <- lista czlonkow grupy oddzielone przecinkami