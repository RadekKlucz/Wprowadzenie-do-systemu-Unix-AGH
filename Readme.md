# Przydatne rzeczy

- Ctrl + D - dokonczenie procesu, wiecej danych juz nie bedzie 
- Ctrl + C - zakonczenie procesu 
- Ctrl + Z - zastopowanie procesu 
- CTRL + L is a keyboard shortcut to clear the screen in the Bash shell
- \$HOME - zmienna srodowiskowa 
```bash
grep bash$ 
```
dolar na koncu oznacza ze slowo bash ma byc ostatnie

# WYRAŻENIA REGULARNE
```bash
 man grep - opis wyrazen regularnych 
 ```

# WSL
```bash
explorer.exe . & 
```
copy file from WSL to Windows, gdzie **.** oznacza katalog w bieżący
```bash
nautilus &
```
open WLS Linux windows

Connection with Bastion (not all commands) and shell (all commands):
```bash 
ssh bastion.ii.agh.edu.pl -l mylogin
```
or:
```bash 
ssh mylog@bastion.ii.agh.edu.pl
```


# OPIS NIEKTORYCH KOMEND 

$ man man <- important command 
$ man 1 passwd <- first page of passwd's documentation,
$ apropos passwd, $apropos passwd | more (better view) <- list of all pages about the passwd command in man,
$ whatis passwd <- brief description about command,

EXAMPLE:
$ whatis ls who rm
OUTPUT:
ls (1)               - list directory contents
who (1)              - show who is logged on
rm (1)               - remove files or directories

$ catman  
$ cat <- concatenate files and print on the standard output // concatenate - łączyć 
$ less <- print lines from a file 
$ head -n 2 <- output the first part of files, the first two lines 
$ tail -n 3 <- output the last part of files, the last three lines 
$ wc -l <- do liczenia lini w tym przypadku (slow i innych tez) 
     -w <- slowa 
     -c <- znaki
$ head -n 5 [file] | tail -1 <- read specified line of file 

$ uniq <- report or omit repeated lines // omit - omiń
	-c <- ilosc wystapien lini 
	-d <- wypisuje powtarzajace sie linie 
	-u <- wypisuje tylko niepowtarzajace sie linie  
$ cal <- display a calendar and the date of Easter
$ bc <- calculator 
$ pwd <- print name of current/working directory 
$ echo <- display a line of text 
$ echo $HOME <- display the variable of HOME
$ last <- show a listing of last logged in users 
$ last -f [file] <- show a list of users who used this file 
$ who <- show who is logged on 
$ w <- show who is logged on and what they are doing
$ cd .. or cd -

$ ls <- wypisuje zawartosc aktualnego katalogu lub podanego w argumencie;	
	-a - wypisuje rowniez pliki zaczynajace sie od kropki;
	-d - operuje na podanym katalogu zamiast jego zawartosci;
	-i - wypisuje i-wezly plikow;
	-l - dluzszy listing z informacjami;


$ tree <- display the contents of a directory in a tree hierarchy format, options: -a (all), -d (directory)

-----------------------------------------------------------------------

OPIS PLIKU /etc/passwd <- Podstawowy plik konfiguracyjny

-----------------------------------------------------------------------
I kolumna <- nazwa uzytkownika (login name) 
II kolumna <- kiedys zakodowane haslo, dzisiaj niekiedy informacja o stanie hasla 
III kolumna <- UID, numer identyfikacyjny uzytkowniaka, moze sie powtarzac, 0 - root
IV kolumna <- GID, numer grupy podstawowej, numery niepowtarzalne, decyduje o uprawnieniach 
V kolumna <- opis uzytkownika, zalezy od admina systemu, zmiana zawartosci $ chfn
VI kolumna <- sciezka dostepu tzw. HOME, jak jeje nie ma to po zalogowaniu zaczynamy w sciezce /
VII kolumna <- sciezka dostepu do interpretera uzytkownika, nologin - to blokada dostepu do systemu dla uzytkownika 
  
$ man -s5 passwd <- opis tego pliku w manualu, inne pliki tak tez mozna sobie odczytac  
-----------------------------------------------------------------------

OPIS PLIKU /etc/group <- Opis grup, jedna linia opisuje jedną grupę

-----------------------------------------------------------------------
I kolumna <- nazwa grupy, unikalana w systemie
II kolumna <- kiedys haslo grupowe 
III kolumna <- numer grupy w systemie, niepowtarzalny
IV kolumna <- lista czlonkow grupy oddzielone przecinkami
-----------------------------------------------------------------------

ZADANIA LAB 1

-----------------------------------------------------------------------
1.
$ cat /etc/passwd <- wyswietlenie pliku /etc/passwd, tak naprawde jest to sklejenie pliku z pustka co daje 
				output jak more ale bez mozliwosci przewijania
$ cat /etc/passwd | more <- wyswietlenie pliku /etc/passwd w programie more

$ more /etc/passwd <- ludzie z godnioscia czlowieka to uzywaja a nie jakies cat!

2.
$ less /etc/group <- wyswietlenie pliku /etc/group a dokladnie jego lini w programie less
less /etc/group | grep 12 <- z szukaniem 12 

3.
$ head -n 17 /etc/passwd
$ tail -21 /etc/passwd
$ head -n 27 /etc/passwd | tail -n 1

4.
wc <- print newline, word, and byte counts for each file

5.
uniq <- report or omit repeated lines

6.
cal, ncal <- displays a calendar and the date of Easter

$ cal -m 12 
czwartek

$ cal 9 1752 | awk 'NF {DAYS = $NF}; END {print DAYS}' 
30
	NF <- The number of fields in the current input record.

7.
$ bc

8.
pwd <- print name of current/working directory

9.
cd <- Change the shell working directory.

brak wpisu w manualu

10.
ls <- list directory contents

       -d, --directory
              list directories themselves, not their contents

       -l     use a long listing format

       -i, --inode
              print the index number of each file

       -t     sort by modification time, newest first

       -r, --reverse
              reverse order while sorting

11.
echo <- display a line of text

$ echo $HOME 
/home/s125

$ echo $PATH 
/home/s125/.local/bin:/home/s125/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin

$ echo $PS1
[\u@\h \W]\$

12.
last, lastb <- show a listing of last logged in users
/var/log/wtmp

13.
who <- show who is logged on

       -b, --boot
              time of last system boot

       -m     only hostname and user associated with stdin

       -u, --users
              list users logged in

14.
co robia uzytkownicy i ile zasobow uzywaja
-----------------------------------------------------------------------

PODAJ POSTAĆ LINII KOMEND, LAB 1

-----------------------------------------------------------------------
1.
$ cat /etc/passwd | wc -l
332

2.
$ cat /etc/passwd | awk '{ FS=":" } $3==14 { print $5 }'
FTP User
       FS - The input field separator, a space by default.  See Fields, above.

$ more /etc/passwd | awk '{FS=":"} $4==1000 {print $5}' | wc -l 

3.
# echo $(id -g $whoami) | xargs -I % sh -c "cat /etc/passwd | awk '{ FS=\":\" } \$4==% { print }'" | wc -l <- to nie dziala !!!!

$ more /etc/passwd | grep "$(id -gn):" | wc -l
1

4.
$ more /etc/passwd | awk '{ FS=":" } $7=="/bin/bash" { print "" }' | wc -l
308

$ more /etc/passwd | grep /bin/bash | wc -l
309

druga jest poprawna, nw dlaczego pierwsza pomija roota (1 linijka w /etc/passwd)

5.
$ more /etc/passwd | awk '{ FS=":" } $3>12000 { print "" }' | wc -l
1

6.
$ ls ~ / <- wylistowanie kilku katalogow na raz 

7.
$ for i in {0..5}; do echo $i; done
-----------------------------------------------------------------------

ZADANIA SPRAWDZAJĄCE LAB 1

-----------------------------------------------------------------------
1.
$ ls / | wc -l
19

2.
$ who -q

3.
$ more /usr/include/utime.h | wc -w
-----------------------------------------------------------------------

LAB 2

-----------------------------------------------------------------------

AWK

-----------------------------------------------------------------------
1.
- mozna bezposrednio w konsoli, mozna tez zapisac do pliku i uruchomic awk -f /path/to/file

- $0 - wiersz
  $x - x-te kolumna

- awk '{ FS=":" } { print $x }'

- { FS=":" }

... moze pozniej bedzie mi sie chcialo
... mi tez sie nie chce

2. 
$ more /etc/passwd | awk '{ FS=":" } { print $3 }'
-----------------------------------------------------------------------

ZADANIA, LAB 2

-----------------------------------------------------------------------
1.
tr - translate or delete characters

       -d, --delete
              delete characters in SET1, do not translate

       -s, --squeeze-repeats
              replace each sequence of a repeated character that is listed in the last specified SET, with a single occurrence of
              that character

       -t, --truncate-set1
              first truncate SET1 to length of SET2

cut - remove sections from each line of files

       -b, --bytes=LIST
              select only these bytes

       -c, --characters=LIST
              select only these characters

       -d, --delimiter=DELIM
              use DELIM instead of TAB for field delimiter

       -f, --fields=LIST
              select  only  these fields;  also print any line that contains no delimiter character, unless the -s option is speci‐
              fied

2.
$ more /etc/passwd | awk '{ FS=":" } $3==14 { print $5 }'
FTP User

3.
$ more /etc/passwd | grep "$(id -gn):" | wc -l
1

4.
$ more /etc/passwd | grep /bin/bash | wc -l
309

5.
$ more /etc/passwd | awk '{ FS=":" } $3>20 { print "" }' | wc -l
320

6.
$ more /etc/passwd | awk 'BEGIN { max=-1 } { FS=":" } $4>max { max=$4 } END { print max }'
65534

7. ????
$ diff <(cat /etc/passwd | awk '{ FS=":" } { print $4 }') <(cat /etc/group | awk '{ FS=":" } { print $3 }') | grep '^[<>].' | wc -l
30

8.
$ more /etc/group | awk '{ FS=":" } $4=="" { print "" }' | wc -l
348

9.
$ more /etc/passwd | awk '{ FS=":" } length($1)==8 { print $1 }'

10.
$ man ls > ~/man_ls <- nadpisuje
$ man ls >> ~/man_ls <- dopisuje
-----------------------------------------------------------------------

OPERACJE NA PLIKACH, LAB 2

-----------------------------------------------------------------------
1.
mkdir <- make directories

rmdir <- remove empty directories

ls <- list directory contents

$ mkdir -p ~/c2/text ~/c2/bin

       -p, --parents
              no error if existing, make parent directories as needed

2.
ls -R ~ <- zawartosc wszystkich katalogow do samego konca drzewa plikow

3.
$ ls -l man_ls
-rw-rw-r--. 1 s125 s125 361 11-04 10:36 man_ls

$ chmod 600 man_ls
$ ls -l man_ls
-rw-------. 1 s125 s125 361 11-04 10:36 man_ls
-----------------------------------------------------------------------

UPRAWINIENIA, WYJASNIENIE, LAB 2

-----------------------------------------------------------------------
Na przyklad:
drwxr-x---
0123456789

Pozycja 0: d (dir), l (link), b  (block), c (character)
Pozycja 1, 2 i 3: uprawnienia właściciela ‘u’
Pozycja 4, 5 i 6: uprawnienia grupy ‘g’
Pozycja 7, 8 i 9: uprawnienia pozostałych ‘o’
Pozycje 1..9: uprawnienia wszystkich ‘a’

rwx - read, write, eXecute
421 - zapis binarny, np. r-x = 5, rw- = 6, r-- = 4.


O co chodzi z uprawinieniami: 

0	---	brak uprawnień				blokada
1	--x	wykonywanie					nieprzydatne katalog bez podglądu
2	-w-	zapis						zbieranie sekretnych logów
3	-wx	zapis i wykonywanie			nieprzydatne
4	r--	odczyt						stała konfiguracja
5	r-x	odczyt i uruchamianie			pliki wykonywalne, katalogi
6	rw-	odczyt i zapis				pliki edytowalne
7	rwx	odczyt, zapis i uruchamianie	skrypty i katalogi usera :-)
	??s	bit suid						programy specjalne
	??t	sticky bit					katalog specjalny

Czyli w poleceniu chmod sa trzy liczby np: $ chmod 600 [plik] oznacza, ze odczyt i zapis zostanie nadany tylko dla 
wlasciciela a dla grupy i pozostalych (kolejne dwie cyfry po 6) oznaczaja brak dostepu! EASY


s - uprawnienia procesu wykonujacego to polecenie bada takie jak uprawnienia administratora (wlasniciela pliku)
-----------------------------------------------------------------------
4.
moja to: 
$ chmod 400 [plik/katalog]

chmod +t man_ls ????

$ ls -l man_ls
-rw------T. 1 s125 s125 361 11-04 10:36 man_ls

$ cp man_ls c2/text/

i nastepnie ja zrobilem:

$ chmod 440 [plik]

$ ls -l man_ls 
-rw-------. 1 s125 s125 361 11-04 10:50 man_ls



5.
$ cp /bin/ls ~/c2/bin/moj_ls

$ cp -r /usr/include/scsi/ ~/c2/bin
-----------------------------------------------------------------------

ZADANIA SPRAWDZAJĄCE, LAB 2

-----------------------------------------------------------------------
2.
cat /etc/passwd | grep /sbin/nologin | wc -l

moje daje inny wynik, czemu?
$ more /etc/passwd | awk '{FS=":"} $7="/sbin/nologin" {print $7}' | wc -l


3.
$ cat /etc/group | awk '{ FS=":" } $5=="Nowak" { print "" }' | wc -l
0

4.$10[2]==1
$ last | awk '{ FS=" " } substr($10, 2, 2)+0>1 { print "" }' | wc -l
35

linki twarde i symboliczne 

-----------------------------------------------------------------------

ZADANIA, LAB 3

-----------------------------------------------------------------------

1. 
tak
ls -R $HOME

2.
https://www.thegeekdiary.com/what-is-suid-sgid-and-sticky-bit/#:~:text=Set%2Duser%20Identification%20(SUID)&text=%E2%80%93%20When%20a%20command%20or%20script,user%20who%20is%20running%20it.&text=%E2%80%93%20The%20setuid%20permission%20displayed%20as,in%20the%20owner's%20execute%20field.

3.
mkdir -p ~/c2/text && man ls > ~/c2/text/man_ls && ls -l ~/c2/text/man_ls
-rw-rw-r--.
 ^
 owner: read, write
    ^
    owner's primary group: read, write
       ^
       others: read

rwx
010 => dec => 2

-rw-rw-r--.
 110 110 100 => 6 6 4

4.
chmod 600 ~/c2/text/man_ls
chmod -R +t ~/c2/text

5.
cp ~/c2/text/man_ls ~/c2/text/man_ls_cp
takie same prawa dostepu, bez sticky bitu

chmod 440 ~/c2/text/man_ls_cp

6.
umask
umask 0001

7.
find ~ -maxdepth 2 -ls | sort -rnk7 | head -n 1 | awk '{ FS=" " } { print $11 }'

Moje rozwiazanie: 

du -a $(pwd) | sort -nr | head -n 5

8.
find ~ -ls | sort -rnk2 | head -n 1 | awk '{ FS=" " } { print $11 }'

9.
find /usr/include -type f -name "c*" -ls

10.
find ~ -maxdepth 1 -mtime +2 -type f -ls
find ~ -mtime +2 -type f -ls

11.
find /usr/include -maxdepth 1 -type f -name "m*.h" -size -12k

12.
tar -cf c2.tar c2
gzip c2.tar

tar -czf c2.tar.gz c2

rm -rf c2
tar -xf c2.tar.gz

13.
quota
du -sb ~

14.
df - report file system disk space usage
free - Display amount of free and used memory in the system



ZADANIE SPRAWDZAJĄCE
1.
ls ~ -l --sort=t | tail -n 1 | awk '{ FS=" " } { print $8 }'

2.
find /usr/include -maxdepth 1 -type d | wc -l

3.
find /usr/include -maxdepth 1 -type f -name "m???.h" | wc -l

4.
find /usr/include -maxdepth 1 -type f -size +12000c

5.
find /usr/bin -maxdepth 1 -type f -size -1M | wc -l

-----------------------------------------------------------------------

ZADANIA LAB 4

-----------------------------------------------------------------------

TROCHE TEORII

-----------------------------------------------------------------------

NICE:
https://pl.wikipedia.org/wiki/Nice_(Unix)

PS: 
https://pl.wikipedia.org/wiki/Ps

KILL:
https://pl.wikipedia.org/wiki/Kill_(polecenie)

1.

ps - report a snapshot of the current processes.

$ ps axo %p%P <- do okreslenia numeru procesu PID i numeru procesu rodzica PPID
$ ps axo pid,pid <- ta sama wersja co wyzej ale latwiejsza

$ ps axo %mem,bsdtime <- do okreslenia zajmowanej pamieci i czasu uruchomienia

%mem        %MEM      ratio of the process's resident set size  to the physical memory on the machine,
                             expressed as a percentage.  (alias pmem).

bsdstart    START     time the command started.  If the process was started less than 24 hours ago, the
                             output format is " HH:MM", else it is " Mmm:SS" (where Mmm is the three letters of
                             the month).  See also lstart, start, start_time, and stime.


$ ps axo %y <- do okreslenia terminala 

$ ps axo %a <- do okreslenia jakim (pelnym) poleceniem zostal wywolany proces

1   UNIX options, which may be grouped and must be preceded by a dash.
2   BSD options, which may be grouped and must not be used with a dash.

2.

$ ps o user,pid,pri,nice,tty

 o format
              Specify user-defined format.  Identical to -o and --format.

 --user userlist
              Select by effective user ID (EUID) or name.  Identical to -u and U.
 --pid pidlist
              Select by process ID.  Identical to -p and p.

 --ppid pidlist
              Select by parent process ID.  This selects the processes with a parent process ID in pidlist.  That
              is, it selects processes that are children of those listed in pidlist.
 --tty ttylist
              Select by terminal.  Identical to -t and t.

--pri <- wartosc piorytetu 

--nice <- parametr NICE

--cmd <- uzyteczne do wypisania nazwy procesu, skryptu ktory go zainicjowal 


3.
PRZYKLADOWE:
$ ps o %mem,pri,nice,command | grep prog | head -n 1

MOJE:
$ ps axo %mem,bsdtime,pri,nice,pid,cmd | grep prog.out | head -n 1 

ODP:
pri: 19
nice: 0

$ renice [NR PIORYTETU] [NR PROCESU] <- do obnizenia wartosci parametru NICE 

NAME
       renice - alter priority of running processes

SYNOPSIS
       renice [-n] priority [-g|-p|-u] identifier...

DESCRIPTION
       renice alters the scheduling priority of one or more running processes.  The first argument is the priority
       value to be used.  The other arguments are interpreted as process IDs (by default), process group IDs, user
       IDs,  or  user  names.   renice'ing a process group causes all processes in the process group to have their
       scheduling priority altered.  renice'ing a user causes all processes owned by the user to have their sched‐
       uling priority altered.

ODP:
pri: 0
nice: 19

zwiazek:
pri + nice = 19

Zakres w jakim mozna zmieniac parametr NICE
nice [-20, 19]

im wyzsze prio tym wiecej cpu%
im wyzszy nice tym mniej cpu%

4.
nie dziala proces po wylogowaniu sie 

5.
nie istnieje proces w tle

6.
nohup - uniksowe polecenie używane do uruchamiania innego programu w taki sposób, 
aby ten nie został wyłączony podczas wylogowania. W systemie GNU ten program jest w pakiecie GNU Coreutils.

$ nohup ./prog.out & <- uruchonienie procesu 
$ ./nohup.out <- powrot do tego procesu 

7.
$ kill -L <- lista dostepnych sygnalow do wyslania procesowi (wyswietla ich numery) 

19) to SIGSTOP

$ kill -n [nr sygnalu] [nr procesu]

$ kill -n 19 [NR PROCESU]
stan: T - proces w stanie zatrzymania
zuzycie cpu spada

18) to SIGCONT 

$ kill -n 18 [NR PROCESU]
stan: R
zuzycie cpu wzrasta

8.
3) to SIQUIT
$ kill -n 3 [nr procesu]
stan: S+
output: Otrzymalem sygnal 3

20) to SIGTSTP
$ kill -n 20 [nr procesu]
stan: S+
output: Otrzymalem sygnal 20

15) to SIGTERM
$ kill -n 15 [nr procesu]
stan: S+
output: Otrzymalem sygnal 15

9) to SIGKILL
$ kill -n 9 [nr procesu]
stan: dead

lub 

kill -9 [nr procesu]

9.
ps axo pid,stat,vsz | grep " T " | sort -nrk 3 | head -n 1 | awk '{ FS=" " } { print $1 }'

pierwsza kolumna wyswietla pid, status (te literki), kolejna bierze pod uwage tylko z litera T (stan zatrzymania),
3 kolumna do sortowania od najwiekszego do najmniejszego po kolumnie 3 (defaultowo -nrk), dalej znane 

10.
$ ps axo user,nice | awk '{ FS=" " } $2==0 { print $1 }' | sort | uniq -c | sort -n | tail -n 1

MOJE:
$ ps axo user,nice | awk '{FS=" "} $2==0 {print $1}' | sort | uniq -c | head -n 1 | awk '{FS=" "} {print $2}'


11.
$ ps axo vsz,pid | sort -n | tail -n 3 | awk '{ FS=" " } { print $2 }'

MOJE: (UWAGA najwiecej pamieci wirtualniej oznacza to ze zajmuja jej jak najmniej!!!)
$ ps axo pid,vsz | sort -nk 2 | head -n 5 | tail -n 4 | awk '{FS=" "} {print $2}'

-----------------------------------------------------------------------

ZADANIE SPRAWDZAJĄCE

-----------------------------------------------------------------------

1. 
ps L <- wypisuje wszystkie dostepnie nazwy kolumn dla komendy ls

2.
$ ps -U root o pid,size --sort size

MOJE:
$ ps axo user,pid,size | head -n 4 | sort -n

3.
ps --ppid 1 | wc -l

MOJE:
$ ps axo pid,ppid | awk '{FS=" "} $1==1 {print $2}' | wc -l

POPRAWNIE I MOJE:

$ ps --ppid 1  | sed -n '2,$p' | wc -l <- sed pozwala na print od 2 linijki az do konca co pozwala uniknac naglowkow

4.
$ ps axo user | sort | uniq -c | sort -n | tail -n 1

MOJE:
$ ps axo user | uniq -c | sort -r | head -n 1

TU KONIEC !!!
5.
ps axo pid,%cpu --sort %cpu | tail -n 1 | awk '{ FS=" " } { print $1 }'

6.
echo $(( $(ps | wc -l) - 4))

