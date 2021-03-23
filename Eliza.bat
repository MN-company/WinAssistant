@echo off
:: STARTUP
title Eliza
set ElizaVer=1.2.5
set speech=start scripts\nircmd.exe speak text
VER | findstr /i "5.1." > nul
IF %ERRORLEVEL% EQU 0 set version=xp
VER | findstr /i "6.1." > nul
IF %ERRORLEVEL% EQU 0 set version=w7
color %color%
setlocal
goto Check-Skip-dir

:Check-Skip-dir
cd Skip-File
if exist Auto-xavv-disable.xavv (goto Skip-Simple-setting-avv) else (goto Check-Skip-dir2)

:Check-Skip-dir2
if exist Auto-xavv-enable.xavv (goto Skip-Simple-setting-avv) else (goto Skip-Simple-setting)

:restart
cd..
echo                                                     ----------------------- 
echo                                                       Logged in as: %username%
echo                                                     -----------------------
echo.
echo                                   Eliza
echo                                   -----------
echo                      New Reinvented Windows Assistant
echo                          ------      %ElizaVer%      ------
echo                                     -------
echo                                  RELEASE VERSION
echo                                     -------
echo.
echo.
echo.
echo.
:newvoice
echo.
pause
goto start

:Skip-Simple-setting-avv
cd Skip-File
if exist "simple-setting.xconfig" (goto Skip-simple-setting-dimension) else (goto simple-setting)
echo.

:Skip-simple-setting-dimension
if exist "simple-setting-1.xconfig" (goto setdim-1-all) else (goto setdim-2-all)
echo.

:simple-setting
echo.
echo Seleziona lo stile che ti piace:
echo.
echo 51, 44 (In stile Cortana)
echo Defoult (Grandezza di defoult)
choice /c 12 /n
if %errorlevel% == 1 goto setdim-1
if %errorlevel% == 2 goto setdim-2

:setdim-1
set XYZ=51, 44
echo %XYZ% > simple-setting-1.xconfig
echo Simple-setting > simple-setting.xconfig
goto Skip-Simple-setting-avv

:setdim-2
set XYZ=120, 30
echo %XYZ% > simple-setting-2.xconfig
echo Simple-setting > simple-setting.xconfig
goto Skip-Simple-setting-avv

:setdim-1-all
set XYZ=51, 44
goto Skip-change-color

:setdim-2-all
set XYZ=120, 30
echo restart > set-start-2.xconfig
goto Skip-change-color

:simple-setting-color
echo.
echo Seleziona lo stile che ti piace:
echo.
echo Sfondo nero; Scritte blu
echo Sfondo nero; Scritte gialle
echo Sfondo nero; Scritte verdi
echo Sfondo nero; Scritte rosse
echo Sfondo nero; Scritte fucsia
echo.
choice /c 12345 /n
if %errorlevel% == 1 goto color-b
if %errorlevel% == 2 goto color-e
if %errorlevel% == 3 goto color-a
if %errorlevel% == 4 goto color-c
if %errorlevel% == 5 goto color-d


:Skip-change-color
cd C:\ElizaFile\Skip-File
if exist "color-setting.xconfig" (goto Color-G-P) else (goto simple-setting-color)

:color-b
set color=B
echo %color% > select-color-b.xconfig
echo color-setting > color-setting.xconfig
goto Skip-change-color

:color-e
set color=E
echo %color% > select-color-e.xconfig
echo color-setting > color-setting.xconfig
goto Skip-change-color

:color-a
set color=A
echo %color% > select-color-a.xconfig
echo color-setting > color-setting.xconfig
goto Skip-change-color

:color-c
set color=C
echo %color% > select-color-c.xconfig
echo color-setting > color-setting.xconfig
goto Skip-change-color

:color-d
set color=D
echo %color% > select-color-d.xconfig
echo color-setting > color-setting.xconfig
goto Skip-change-color

:Color-G-P
if exist "select-color-b.xconfig" (goto color-B) else (goto Color-G-P1)

:Color-G-P1
if exist "select-color-e.xconfig" (goto color-E) else (goto Color-G-P2)

:Color-G-P2
if exist "select-color-a.xconfig" (goto color-A) else (goto Color-G-P3)

:Color-G-P3
if exist "select-color-c.xconfig" (goto color-C) else (goto Color-G-P4)

:Color-G-P4
if exist "select-color-d.xconfig" (goto color-D) else (goto simple-setting-color)

:color-B
set color=B
cd..
goto Skip-check-eta-1

:color-E
set color=E
cd..
goto Skip-check-eta-1

:color-A
set color=A
cd..
goto Skip-check-eta-1

:color-C
set color=C
cd..
goto Skip-check-eta-1

:color-D
set color=D
cd..
goto Skip-check-eta-1

:user-eta
echo.
echo Seleziona l'opzione più adatta a te:
echo.
echo Sono minorenne
echo Sono maggiorenne
echo.
choice /c 12 /n
if %errorlevel% == 1 goto minorenne-1
if %errorlevel% == 2 goto maggiorenne-1

:Skip-check-eta-1
echo.
cd C:\ElizaFile\Skip-File
if not exist "user-underage.xconfig" (goto Skip-check-eta-2) else (goto set-eta-17)

:Skip-check-eta-2
echo.
cd C:\ElizaFile\Skip-File
if not exist "user-adult.xconfig" (goto user-eta) else (goto set-eta-18)

:minorenne-1
echo.
cd Skip-File
if not exist "user-underage.xconfig" (goto minorenne-2) else (goto Skip-check-eta-1)

:minorenne-2
echo eta=17 > user-underage.xconfig
goto set-eta-17

:set-eta-18
set ETA=18
cd..
goto username

:set-eta-17
set ETA=17
cd..
goto username

:maggiorenne-1
echo.
cd Skip-File
if not exist "user-adult.xconfig" (goto maggiorenne-2) else (goto Skip-check-eta-1)

:maggiorenne-2
echo eta=18 > user-adult.xconfig
goto set-eta-18

:username
cd Skip-File
if exist "username-nickname.txt" (goto startonwake) else (goto username-2)

:username-2
echo.
set/p "user=Inserisci il tuo Username: "
if '%user%' == '' echo Username non valido. Inserisci un Username valido. && pause && goto username
choice /c SN /m "Confermi il tuo Username '%user%' ?"
if %errorlevel% == 2 goto username-2
echo %user% > username-nickname.txt
echo Username confermato.
goto check-mailclient-dir

:check-mailclient-dir
cd Skip-File
if exist client-dir.xconfig (goto mailclient) else (goto mailclient-dir)

:mailclient-dir
cd..
mkdir Client
cd Skip-File
echo client-dir > client-dir.xconfig
goto mailclient

:mailclient
cd..
if exist Client (goto mailclient-a) else (goto mailclient-dir)


:mailclient-a
cd Client
if not exist "gmail-client.txt" (goto mailclient-b) else (goto browserclient)
echo.

:mailclient-b
if not exist "outlook-client.txt" (goto mailclient-d) else (goto browserclient)
echo.

:mailclient-d
echo.
if not exist "yahoo-client.txt" (goto mailclient-e) else (goto browserclient)

:mailclient-e
echo.
if not exist "libero-client.txt" (goto mailclient-f) else (goto browserclient)

:mailclient-f
if not exist "thunderbird-client.txt" (goto mailclient-g) else (goto browserclient)

:mailclient-g
if not exist "other-client.txt" (goto mailclient-1) else (goto browserclient)

:mailclient-1
echo.
echo Bene %user%, seleziona il client di mail che usi:
echo.
echo Gmail
echo Outlook
echo Yahoo Mail
echo Libero Mail
echo Mozilla Thunderbird
echo Nessuno di questi
echo.
choice /c 1234567 /n
if %errorlevel% == 1 goto gmail-a
if %errorlevel% == 2 goto outlook-b
if %errorlevel% == 3 goto yahoo-d
if %errorlevel% == 4 goto libero-e
if %errorlevel% == 5 goto thunderbird-f
if %errorlevel% == 6 goto other-g

:gmail-a
if exist "gmail-client.txt" (goto SP-var) else (goto gmail-1)

:gmail-1
echo gmail > gmail-client.txt
goto gmail-a

:outlook-b
if exist "outlook-client.txt" (goto SP-var) else (goto outlook-1)

:outlook-1
echo outlook > outlook-client.txt
goto outlook-b

:yahoo-d
if exist "yahoo-client.txt" (goto SP-var) else (goto yahoo-1)
echo.

:yahoo-1
echo yahoo > yahoo-client.txt
goto yahoo-c

:libero-e
if exist "libero-client.txt" (goto SP-var) else (goto libero-1)
echo.

:libero-1
echo libero > libero-client.txt
goto libero-d

:thunderbird-f
if exist "thunderbird-client.txt" (goto SP-var) else (goto thunderbird-1)
echo.

:thunderbird-1
echo thunderbird > thunderbird-client.txt
goto thunderbird-e

:other-g
if exist "other-client.txt" (goto SP-var) else (goto other-1)
echo.

:other-1
echo other > other-client.txt
goto other-f

:Web-app-spotify
echo.
echo Di norma utilizzi Spotify Web o Spotify installato sul tuo PC?
echo.
echo Spotify Web
echo Spotify.exe
echo.
choice /c 12 /n
if %errorlevel% == 1 goto SP-web
if %errorlevel% == 2 goto SP.exe
echo.

:SP-web
echo.
cd Client
echo SP-web > Spotify-web.xclient
cd..
goto SP-var

:SP.exe
echo
cd Client
echo SP.exe > Spotify-exe.xclient
cd..
goto SP-var

:SP-var
echo.
cd Client
if exist Spotify-web.xclient (goto SP-var-2) else (goto SP-var-1)

:SP-var-1
echo.
if not exist Spotify-exe.xclient (goto Web-app-spotify) else (goto SP-var-2)

:SP-var-2
if exist Spotify-web.xclient (set spotify=web && goto select-dialogo) else (set spotify=exe && goto select-dialogo)
echo.

:start-dialogo-eliza
echo.
echo Scegli come Eliza si rivolgerà a te:
echo.
echo Ciao %user%,cosa posso fare per te? (Defoult)
echo Hei %user%,ti posso aiutare?
echo Sono qui a tua disposizione %user%!
echo Personalizzato, una frase a tua scelta.
echo.
choice /c 1234 /n 
if %errorlevel% == 1 goto start-dialogo-eliza-1
if %errorlevel% == 2 goto start-dialogo-eliza-2
if %errorlevel% == 3 goto start-dialogo-eliza-3
if %errorlevel% == 4 goto start-dialogo-eliza-4

:start-dialogo-eliza-1
cd Skip-File
echo Ciao %user%,cosa posso fare per te? > Dialogo.txt
cd..
goto select-dialogo

:start-dialogo-eliza-2
cd Skip-File
echo Hei %user%,ti posso aiutare? > Dialogo.txt
cd..
goto select-dialogo

:start-dialogo-eliza-3
cd Skip-File
echo Sono qui a tua disposizione %user%! > Dialogo.txt
cd..
goto select-dialogo

:start-dialogo-eliza-4
cd Skip-File
set/p "dialogo=Inserisci una frase personalizzata: "
echo %dialogo% > Dialogo.txt
cd..
goto select-dialogo

:select-dialogo
cd C:\ElizaFile\Skip-File
if exist Dialogo-1.txt (set dialogo=Ciao %user%,cosa posso fare per te? && goto startonwake) else (goto select-dialogo-1)

:select-dialogo-1
cd C:\ElizaFile\Skip-File
if exist Dialogo-2.txt (set dialogo=Hei %user%,ti posso aiutare? && goto startonwake) else (goto select-dialogo-2)

:select-dialogo-2
cd C:\ElizaFile\Skip-File
if exist Dialogo-3.txt (set dialogo=Sono qui a tua disposizione %user%! && goto startonwake) else (goto select-dialogo-3)

:select-dialogo-3
cd C:\ElizaFile\Skip-File
if exist Dialogo-4.txt (set dialogo=<"C:\ElizaFile\Skip-File\Dialogo-4.txt" && goto startonwake) else (goto start-dialogo-eliza)

:startonwake
cd..
mode %XYZ%
color %color%
set /p user=<"C:\ElizaFile\Skip-File\username-nickname.txt"
set /p user=<"C:\ElizaFile\Skip-File\Dialogo.txt"
echo %dialogo%
%speech% "%dialogo%"
goto start

:start
echo.
set /p C=Chiedi a Eliza: 
echo.
if "%C%"=="jarvis" goto jarvis
if "%C%"=="promemoria" goto promemoria
if "%C%"=="program:cryptotab" goto opencryptotab
if "%C%"=="program:firefox" goto openfirefox
if "%C%"=="program:edge" goto openedge
if "%C%"=="program:msn" goto openmsn
if "%C%"=="introduce" goto introduce
if "%C%"=="mute" goto mute
if "%C%"=="muto" goto mute
if "%C%"=="muto!" goto mute
if "%C%"=="mutati" goto mute
if "%C%"=="stai zitto" goto mute
if "%C%"=="stai zitto!" goto mute
if "%C%"=="Stai zitto" goto mute
if "%C%"=="Stai zitto!" goto mute
if "%C%"=="Fai silenzio" goto mute
if "%C%"=="Fai silenzio!" goto mute
if "%C%"=="fai silenzio!" goto mute
if "%C%"=="fai silenzio!" goto mute
if "%C%"=="unmute" goto unmute
if "%C%"=="smutati" goto unmute
if "%C%"=="Smutati" goto unmute
if "%C%"=="Smutati!" goto unmute
if "%C%"=="smutati!" goto unmute
if "%C%"=="Ripristina il volume" goto unmute
if "%C%"=="Ripristina il volume!" goto unmute
if "%C%"=="ripristina il volume" goto unmute
if "%C%"=="Attiva il volume" goto unmute
if "%C%"=="Attiva il volume!" goto unmute
if "%C%"=="attiva il volume" goto unmute
if "%C%"=="attiva il volume!" goto unmute
if "%C%"=="shutdown" goto shutdown
if "%C%"=="spegni" goto shutdown
if "%C%"=="buonanotte" goto shutdown
if "%C%"=="Buonanotte" goto shutdown
if "%C%"=="buonanotte!" goto shutdown
if "%C%"=="Buonanotte!" goto shutdown
if "%C%"=="notte" goto shutdown
if "%C%"=="Notte" goto shutdown
if "%C%"=="notte!" goto shutdown
if "%C%"=="Notte!" goto shutdown
if "%C%"=="killtask" goto killtask
if "%C%"=="volumeup" goto volup
if "%C%"=="volumedown" goto voldown
if "%C%"=="volumemax" up goto volmax
if "%C%"=="help" goto help
if "%C%"=="spitshine" goto fuckoffsir
if "%C%"=="cmd" goto cmd
if "%C%"=="time" goto time
if "%C%"=="date" goto %version%date
if "%C%"=="time and date" goto %version%dat
if "%C%"=="program" goto program
if "%C%"=="tasklist" goto tasklist
if "%C%"=="alarm" goto alarm
if "%C%"=="spotify" goto Spotify
if "%C%"=="playlists" goto playlists
if "%C%"=="mos" goto mos
if "%C%"=="lock" goto lock
if "%C%"=="msnstat" goto msnstat
if "%C%"=="sendim" goto sendim
if "%C%"=="msnbrowse" goto msnbrowse
if "%C%"=="close" goto close
if "%C%"=="off out" goto offout
if "%C%"=="im back" goto imback
if "%C%"=="killmos" goto killmos
if "%C%"=="thankyou" goto thankyou2
if "%C%"=="voice" goto voicemode
if "%C%"=="speak" goto speak
if "%C%"=="version" goto version
if "%C%"=="" goto start
if "%C%"=="new" start jarvis.exe && goto start
if "%C%"=="weather" goto weather
if "%C%"=="screen off" goto screenoff
if "%C%"=="screensaver" goto screensaver
if "%C%"=="dim" goto dim
if "%C%"=="dim stop" goto dimstop
if "%C%"=="forecast" goto forecast
if "%C%"=="news" goto news
if "%C%"=="contact us" (echo Please email us at: "jarviscmd@gmail.com" to ask us any questions!) && goto start
if "%C%"=="restart" cls && call jarvis.bat
if "%C%"=="set" %speech% Security breach detected. Access denied. && goto start
if "%C%"=="set " %speech% Security breach detected. Access denied. && goto start
if "%C%"=="goto suicide" %speech% Security flaw detected. Access denied. && goto start
::WHEN ADDING NEW COMMAND IT MUST START: if "%C%"=="command"
%C%
goto start

:mute
call scripts\nircmd.exe mutesysvolume 2
echo Ok imposto volume su 0.
goto start

:unmute
call scripts\nircmd.exe mutesysvolume 2
echo Ok, ho riportato il volume com'era prima!
%speech% "Ok, ho ripristinato il volume!"
goto start

:introduce
echo.
%speech% "Ciao %username%, mi chiamo Eliza. Sono una VLA, un Virual Life Assistant. La mia funzione principale è assistere l'utente in ogni modo possibile per semplificare la vita quotidiana."
echo Ciao %username%, mi chiamo Eliza. Sono una VLA, un Virual Life Assistant. La mia funzione principale è assistere l'utente in ogni modo possibile per semplificare la vita quotidiana.
echo Sono stata creata e concepita dal mio creatore Paolo Gobber, per rimpiazzare Cortana un assistente
echo privo di funzioni essenziali per un lavoro ottimale in Windows.
echo Un obbiettivo che è stato usato per crearmi era ed è quello di tenere al sicuro i dati degli utenti
echo grazie a protezioni multilivello, ho liste di siti bloccati che vengono ritenuti fraudolenti o dannosi per i dati degli utenti
echo e tutti i dati che vengono chiesti alla prima configurazione come l'età verrà usata solo in locale per eseguire controlli di sicurezza.
echo Per esempio se hai dichiarato di essere minorenne non potrai accedere a siti per soli maggiorenni, e questo permette
echo di tenere al sicuro tutti gli utenti che mi utilizzano.
echo.
echo Il codice è open source disponibile alla nostra pagina GitHub, se vuoi contribuire benvenga!
explorer www.github.com/MN-company/WinAssistant

:DeveloperEnterpriseBuild
explorer www.google.it
goto start

:PublicBetaTester
explorer www.google.it
goto start

:EnterpriseBuildTester
explorer www.google.it
goto start

:scherzo-tastiera
echo.
color C
echo Ops, piccolo scherzetto! :)
goto start

:shutdown
echo Buona notte %username%, a domani!.
%speech% "Buona notte %username%, a domani!"
shutdown -s -t 20
echo.
pause
EXIT

:killtask
echo Per favore specificami il nome del processo che vuoi arrestare. (nome.exe)
set /p procname=
taskkill /IM %procname%
echo Ho arrestato il processo desiderato.
goto start

:volup
start scripts\nircmd.exe changesysvolume 13107
echo Ho aumentato il volume del 20%.
goto start

:voldown
start scripts\nircmd.exe changesysvolume -13107
echo Ho diminuito del 20 % il volume.
goto start

:volmax
start scripts\nircmd.exe setsysvolume 65535
echo Ho impostato il volume al massimo.
goto start
echo.

:help
echo Available commands:
echo introduce
echo mute
echo unmute
echo killtask
echo shutdown
echo volumeup
echo volumedown
echo volumemax
echo help
echo self destruct (also "suicide")
echo spitshine
echo cmd
echo time
echo date
echo time and date
echo program
echo tasklist
echo alarm
echo spotify
echo playlists
echo mos
echo lock
echo msnstat
echo msnbrowse
echo sendim
echo close (also exit)
echo off out
echo im back
echo killmos
echo thankyou
echo voice
echo speak
echo version
echo new
echo news
echo weather
echo forecast
echo screen off
echo screensaver
echo dim
echo dim stop
echo contact us
echo restart
echo.
echo For more information please read the readme file.
goto start

:fuckoffsir
echo I'm sorry %user%, have you been on the drugs again? Kindly shut the fuck up sir. :)
%speech% "I'm sorry sir, have you been on the drugs again? Kindly shut the fuck up sir."
goto start

:cmd
echo Ho aperto il promt dei comandi in una nuova finestra!
%speech% "Ho avviato il promt dei comandi in una nuova finestra"
start scripts\cmd.bat
goto start


:time
echo Sono le %time% %user%
%speech% "Sono le %time% , %user%"
goto start

::date

:w7date
set dateyear=%date:~-4%
if %date:~-7,-5%==01 set datemonth=January
if %date:~-7,-5%==02 set datemonth=February
if %date:~-7,-5%==03 set datemonth=March
if %date:~-7,-5%==04 set datemonth=April
if %date:~-7,-5%==05 set datemonth=May
if %date:~-7,-5%==06 set datemonth=June
if %date:~-7,-5%==07 set datemonth=July
if %date:~-7,-5%==08 set datemonth=August
if %date:~-7,-5%==09 set datemonth=September
if %date:~-7,-5%==10 set datemonth=October
if %date:~-7,-5%==11 set datemonth=November
if %date:~-7,-5%==12 set datemonth=December
set dateday=%date:~-10,-8%

echo It is %dateday% %datemonth% %dateyear%, sir.
%speech% "It is %dateday% %datemonth% %dateyear%, sir."
::echo The current date is %date% sir | clip
::start scripts\nircmd.exe speak text ~$clipboard$
goto start

:xpdate
echo It is %date%, sir.
%speech% "It is %date%, sir."
goto start

:w7dat
if %time:~0,-9% GTR 12 (set /a timehour=%time:~0,-9%-12) else set timehour=%time:~0,-9%
if %time:~3,1%==0 (set timeminute=%time:~4,1%) else set timeminute=%time:~3,2%

set dateyear=%date:~-4%
if %date:~-7,-5%==01 set datemonth=January
if %date:~-7,-5%==02 set datemonth=February
if %date:~-7,-5%==03 set datemonth=March
if %date:~-7,-5%==04 set datemonth=April
if %date:~-7,-5%==05 set datemonth=May
if %date:~-7,-5%==06 set datemonth=June
if %date:~-7,-5%==07 set datemonth=July
if %date:~-7,-5%==08 set datemonth=August
if %date:~-7,-5%==09 set datemonth=September
if %date:~-7,-5%==10 set datemonth=October
if %date:~-7,-5%==11 set datemonth=November
if %date:~-7,-5%==12 set datemonth=December
set dateday=%date:~-10,-8%

echo It is currently %timeminute% minutes past %timehour% on %dateday% %datemonth% %dateyear%, sir.
%speech% "It is currently %timeminute% minutes past %timehour% on %dateday% %datemonth% %dateyear%, sir."
::echo The current time and date is %time% on the %date% sir | clip
::start scripts\nircmd.exe speak text ~$clipboard$
goto start

:xpdat
if %time:~0,-9% GTR 12 (set /a timehour=%time:~0,-9%-12) else set timehour=%time:~0,-9%
if %time:~3,1%==0 (set timeminute=%time:~4,1%) else set timeminute=%time:~3,2%

echo It is currently %timeminute% minutes past %timehour% on %date%, sir.
%speech% "It is currently %timeminute% minutes past %timehour% on %date%, sir."
goto start

:program
set /p program=Quale programma vuoi aprire?
echo.
if "%program%"=="firefox" goto openfirefox
if "%program%"=="chrome" goto openchrome
if "%program%"=="edge" goto openedge Crypto Tab
if "%program%"=="cryptotab" goto opencryptotab
if "%program%"=="msn" goto openMSN
if "%program%"=="spotify" goto openspotify
if "%program%"=="notepad" goto opennotepad
if "%program%"=="word" goto openword
if "%program%"=="excel" goto openexcel
if "%program%"=="powerpoint" goto openpowerpoint
if "%program%"=="access" goto openaccess
if "%program%"=="mail" goto openmail
if "%program%"=="publisher" goto openpublisher
if "%program%"=="onenote" goto openonenote
if "%program%"=="notion" goto opennotion
if "%program%"=="start" goto start
if "%program%"=="" echo Programma non valido && goto program
if "%program%"=="other" goto openother
else Unknown program. Please try again.
goto program

:openfirefox
start firefox.exe
echo Firefox aperto con successo!
%speech% "Firefox aperto con successo"
goto start

:openchrome
start chrome.exe
echo Chrome aperto con successo!
%speech% "Chrome aperto con successo"
goto start

:openedge
start msedge.exe
echo Microsoft Edge aperto con successo!
%speech% "Microsoft Edge aperto con successo"
goto start

:opencryptotab
start browser.exe
echo Crypto Tab aperto con successo!
%speech% "Crypto Tab aperto con successo"
goto start

:openpowerpoint
start POWERPNT.exe
echo Powerpoint aperto con successo!
%speech% "Powerpoint aperto con successo"
goto start

:openexcel
start EXCEL.exe
echo Excel aperto con successo!
%speech% "Excel aperto con successo"
goto start

:openword
start WINWORD.exe
echo Word aperto con successo!
%speech% "Word aperto con successo"
goto start

:openaccess
start MSACCESS.exe
echo Access aperto con successo!
%speech% "Access aperto con successo"
goto start

:openpublisher
start MSPUB.exe
echo Publisher aperto con successo!
%speech% "Publisher aperto con successo"
goto start

:openmail
cd Client
if exist gmail-client.txt (set MClient=gmail && goto mailgmail) else (goto openmail-1)
echo.

:mailgmail
echo.
explorer https://mail.google.com/
echo Gmail aperto con successo!
cd..
%speech% "Gmail aperto con successo"
goto start

:openmail-1
if exist outlook-client.txt (set MClient=outlook && goto mailoutlook) else (goto openmail-3)
echo.

:mailoutlook
echo.
start OUTLOOK.exe
echo Outlook aperto con successo!
cd..
%speech% "Outlook aperto con successo"
goto start

:openmail-3
if exist yahoo-client.txt (set MClient=yahoo && goto mailyahoo) else (goto openmail-4)
echo.

:mailyahoo
echo.
explorer https://mail.yahoo.com/
echo Yahoo Mail aperto con successo!
cd..
%speech% "Yahoo Mail aperto con successo"
goto start

:openmail-4
if exist libero-client.txt (set MClient=libero && goto maillibero) else (goto openmail-5)
echo.

:maillibero
echo.
explorer https://mail.libero.it/
echo Libero Mail aperto con successo!
cd..
%speech% "Libero Mail aperto con successo"
goto start

:openmail-5
if exist thunderbird-client.txt (set MClient=thunderbird && goto mailthunderbird) else (goto openmail-6)
echo.

:mailthunderbird
echo.
start thunderbird.exe
echo Thunderbird aperto con successo!
cd..
%speech% "Thunderbird aperto con successo"
goto start

:openmail-6
if exist other-client.txt (set MClient=other && goto mailother) else (goto check-mailclient-dir)
echo.

:mailother
echo.
mode 57, 44
echo Error Client Mail: %MClient%
echo.
echo Ci dispiace che non hai trovato il programma desiderato,
echo ricorda che puoi segnalarci il tutto sulla nostra pagina GitHub
explorer https://github.com/MN-company/WinAssistant
cd..
mode %XYZ%
%speech% "Other Client selezionato"
goto start

:openonenote
start ONENOTE.exe
echo Onenote aperto con successo!
%speech% "Onenote aperto con successo"
goto start

:opennotion
start Notion.exe
echo Notion aperto con successo!
%speech% "Notion aperto con successo"
goto start

:opennotion
start Notion.exe
echo Notion aperto con successo!
%speech% "Notion aperto con successo"
goto start

:openonenote
start Notion.exe
echo Notion aperto con successo!
%speech% "Notion aperto con successo"
goto start

:openMSN
start "C:\program files\windows live\messenger\msnmsgr.exe"
echo Windows Live Messenger should now have opened, sir.
goto start

:openspotify
start "C:\program files\spotify\spotify.exe"
echo Spotify should now have opened, sir.
goto start

:opennotepad
start notepad.exe
echo Notepad should now have opened, sir.
goto start

:openother
echo.
echo Per favore %user%inserisci la diretory del programma
set /p progdir=
start %progdir%
echo Il programma è stato aperto...
goto start

:tasklist
echo Current running processes are now been displayed on my screen, sir.
tasklist
goto start

::ALARM

:promemoria
echo.
mkdir Promemoria
echo A che ora vuoi impostare il promemoria?
%speech% "A che ora vuoi impostare il promemoria?"
set /p promtime=(Ora sono le %time%) :
cd Promemoria
echo %promtime% > promtime.txt
cd..
echo Vuoi aggiungere una descrizione, %user%?
%speech% "Vuoi aggiungere una descrizione, %user%?"
cd Promemoria
set /p promdescrizione=Descrizione (se no, lascia vuoto):
echo %promdescrizione% > promdescrizione.txt
echo.
echo Ora si aprirà un altra istanza di Eliza NON chiuderla
echo altrimenti verrà annullato il promemoria.
echo.
cd..
cd File-Esterni
start Promemoria.bat
cd..
goto start

:alarm
echo A che ora ti sveglerai domani mattina? (H:MM)
%speech% "A che ora ti sveglerai domani mattina?"
set /p alarmtime=(Current time is %time:~0,-6%) : 
echo Qualcos'altro che desidera che aggiunga al tuo risveglio per motivarti, %user%?
%speech% "Qualcos'altro che desidera che aggiunga al tuo risveglio per motivarti, %user%?"
set /p extramsg=Messaggio extra (se no, lascia vuoto):
echo.
echo Options:
echo 'Non riprendere' (no)
echo 'Spegni lo schermo' (off)
echo 'Scurisci lo schermo' (dim)
echo 'Avvia screensaver' (screen) 
set /p alarmoption=Choose an option:  
%speech% "Allarme impostata %user%!"
echo.
echo Allarme impostata %user%. Buonanotte. && echo.
echo Sleeping in 3...
echo Sleeping in 2...
echo Sleeping in 1...
if "%alarmoption%"=="dim" start scripts\dimscreen.exe
if "%alarmoption%"=="off" start scripts\nircmd.exe monitor off
if "%alarmoption%"=="screen" start scripts\nircmd.exe screensaver
cls
mode 
echo                                                     ----------------------- 
echo                                                       Logged in as: %user%
echo                                                     -----------------------
echo.
echo                                      Eliza
echo                                   -----------
echo                      Windows redesigned Intelligent Assistant
echo                          ------      V:%elizaVer%      ------
echo                                     -------
echo                                  STABLE VERSION
echo                                     -------
echo.
echo.
echo.         ____     ___                                                  
echo.        /\  _`\  /\_ \                          __                     
echo.        \ \ \ \_\\//\ \      __     __   _____ /\_\    ___      __     
echo.         \/_\__ \  \ \ \   / __ \ / __ \/\  __ \/\ \ /  _  \  / _  \   
echo.           /\ \ \ \ \_\ \_/\  __//\  __/\ \ \ \ \ \ \/\ \/\ \/\ \ \ \  
echo.           \ `\____\/\____\ \____\ \____\\ \  __/\ \_\ \_\ \_\ \____ \ 
echo.            \/_____/\/____/\/____/\/____/ \ \ \/  \/_/\/_/\/_/\/____\ \...
echo.                                           \ \_\                /\____/
echo.                                            \/_/                \_/__/ 
::if %alarmtime:~2,1% NEQ : (set alarmtime=0%alarmtime%)
:alarmcheck
if %time:~0,5%==%alarmtime% goto alarmplay
ping 123.45.67.89 -n 1 -w 60000 > nul
goto alarmcheck

:alarmplay
if %time:~0,-9% GTR 12 (set /a timehour=%time:~0,-9%-12) else set timehour=%time:~0,-9%
if %time:~3,1%==0 (set timeminute=%time:~4,1%) else set timeminute=%time:~3,2%
echo Good morning, sir. It is currently %timeminute% minutes past %timehour%. I would recommend getting out of bed now, sir. %extramsg%
%speech% "Good morning, sir. It is currently %timeminute% minutes past %timehour%. I would recommend getting out of bed now, sir. %extramsg%"
if "%alarmoption%"=="screen" start scripts\nircmd.exe monitor on
if "%alarmoption%"=="dim" taskkill /F /IM dimscreen.exe > nul
if "%alarmoption%"=="no" EXIT
set alarmoption=
cls
echo                                                     ----------------------- 
echo                                                       Logged in as: %username%
echo                                                     -----------------------
echo.
echo                                   J.A.R.V.I.S 
echo                                   -----------
echo                      Just a rather very intelligent system
echo                          ------      V%jarvisver%       ------
echo                                     -------
echo                                  STABLE VERSION
echo                                     -------
echo.
echo.
echo.
echo.
goto startonwake

:: Music

:Playlists
tree playlists /f
goto start

:mos
echo Buffering Ministry of Sound Radio now, sir.
start playlists\mos.vbs
goto start

:: /Music

:voicemode
echo Available voice profiles:
echo Windows (Default) [type "windows"]
echo J.A.R.V.I.S [type "jarvis"]
set /p voiceprofile=Please choose a voice profile:
if %voiceprofile%==windows set speech=scripts\nircmd.exe speak text
if %voiceprofile%==jarvis set speech=scripts\speech\swift.exe -d scripts\speech\lawrence -p speech/pitch/shift=0.8
echo Active Voice profile changed to %voiceprofile%.
goto newvoice

:Spotify
echo What would you like me to tell Spotify to do, sir? (experimental)
echo.
set /p spcom=
if %spcom%==play start scripts\spotify\spplaypause
if %spcom%==next start scripts\spotify\spnext
if %spcom%==previous start scripts\spotify\spprevious
if %spcom%==mute start scripts\spotify\spmute
if %spcom%==unmute start scripts\spotify\spmute
if %spcom%==jarvis goto jarvis
goto start

:lock
echo Locking my doors now, sir.
%speech% "Locking my doors now, sir."
set /a delay = %1 + 3
ping -n %delay% localhost > nul
rundll32.exe user32.dll, LockWorkStation
goto start

:msnstat
echo What would you like to set your messenger status to, sir?
echo (Choices are: available, busy, away or invisible)
echo.
set /p msnstatus=Set status to: 
if %msnstatus%==busy goto msnbusy
if %msnstatus%==available goto msnavail
if %msnstatus%==away goto msnaway
if %msnstatus%==invisible goto msninvis
pause

:msnbusy
echo.
"C:\program files\windows live\messenger\msnmsgr.exe" /busy
echo Your MSN status has now been changed to busy, sir.
goto start

:msnavail
echo.
"C:\program files\windows live\messenger\msnmsgr.exe" /available
echo Your MSN status has now been changed to available, sir.
goto start

:msnaway
echo.
"C:\program files\windows live\messenger\msnmsgr.exe" /away
echo Your MSN status has now been changed to away, sir.
goto start

:msninvis
echo.
"C:\program files\windows live\messenger\msnmsgr.exe" /invisible
echo Your MSN status has now been changed to invisible, sir.
goto start

:sendim
"C:\program files\windows live\messenger\msnmsgr.exe" /sendim
echo Instant Messenger window opened, sir.
goto start

:msnbrowse
start "C:\program files\windows live\messenger\msnmsgr.exe"
echo Instant Messenger contacts browser has been opened, sir.
goto start

:offout
echo Okay, sir. Have fun.
%speech% "Okay, sir. Have fun."
start scripts\dimscreen.exe
goto start

:imback
echo Hello again, sir. I hope you had a good time.
%speech% "Hello again, sir. I hope you had a good time."
taskkill /F /IM dimscreen.exe > nul
goto start

:killmos
taskkill /F /IM wmplayer.exe > nul
IF %ERRORLEVEL% EQU 0 echo Ministry of sound was successfully stopped.
echo.
goto start

:thankyou2
echo.
echo My pleasure, sir.
%speech% "My pleasure, sir."
goto start

:close
exit

:speak
set /p speechinput=Type a phrase to speak: 
if "%speechinput%"=="stop" goto start
echo %speechinput%
%speech% "%speechinput%"
goto speak

:version
VER | findstr /i "5.1." > nul
IF %ERRORLEVEL% EQU 0 %speech% You are running Windows XP, sir.
VER | findstr /i "6.1." > nul
IF %ERRORLEVEL% EQU 0 %speech% You are running Windows 7, sir.
goto start

:screenoff
start scripts\nircmd.exe cmdwait 2000 monitor off
goto start

:screensaver
start scripts\nircmd.exe screensaver
goto start

:dim
start scripts\dimscreen.exe
goto start

:dimstop
taskkill /IM dimscreen.exe
goto start

:weather
set /p wlocation= <scripts\weather\location.txt
start scripts\xml\getxml.exe -N --directory-prefix=%temp% %wlocation%
:weathercheck
if NOT EXIST %temp%\Next3DaysRSS.xml (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto weathercheck
)
start scripts\weather\parsetoday.vbs
ping 123.45.67.89 -n 1 -w 500 > nul.
:weatherxmlparsecheck
if NOT EXIST %temp%\mintemp.txt (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto weatherxmlparsecheck
)
set /p maxtemp= <%temp%\maxtemp.txt
set /p mintemp= <%temp%\mintemp.txt
set /p condition= <%temp%\condition.txt
echo.
echo The forecast for today is %condition% with highs of %maxtemp:~10% and lows of %mintemp:~10% degrees, sir.
%speech% "The forecast for today is %condition% with highs of %maxtemp:~10% and lows of %mintemp:~10% degrees, sir."
del %temp%\Next3DaysRSS.xml
del %temp%\forecast.txt
del %temp%\today.txt
del %temp%\condition.txt
del %temp%\maxtemp.txt
del %temp%\mintemp.txt
goto start

:forecast
set /p wlocation= <scripts\weather\location.txt
start scripts\xml\getxml.exe -N --directory-prefix=%temp% %wlocation%
:forecastcheck
if NOT EXIST %temp%\Next3DaysRSS.xml (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto forecastcheck
)
start scripts\weather\parseforecast.vbs
ping 123.45.67.89 -n 1 -w 500 > nul.
:forecastxmlparsecheck
if NOT EXIST %temp%\mintemp2.txt (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto forecastxmlparsecheck
)
set /p maxtemp= <%temp%\maxtemp.txt
set /p mintemp= <%temp%\mintemp.txt
set /p condition= <%temp%\condition.txt
set /p maxtemp2= <%temp%\maxtemp2.txt
set /p mintemp2= <%temp%\mintemp2.txt
set /p condition2= <%temp%\condition2.txt
set /p forecastday= <%temp%\day.txt
recho.
echo The forecast for tomorrow is %condition% with highs of %maxtemp:~10% and lows of %mintemp:~10% degrees, and for %forecastday% the forecast is %condition2% with highs of %maxtemp2:~10% and lows of %mintemp2:~10% degrees, sir.
%speech% "The forecast for tomorrow is %condition% with highs of %maxtemp:~10% and lows of %mintemp:~10% degrees, and for %forecastday% the forecast is %condition2% with highs of %maxtemp2:~10% and lows of %mintemp2:~10% degrees, sir."
del %temp%\Next3DaysRSS.xml
del %temp%\forecast.txt
del %temp%\tomorrow.txt
del %temp%\condition.txt
del %temp%\maxtemp.txt
del %temp%\mintemp.txt
del %temp%\aftertomorrow.txt
del %temp%\day.txt
del %temp%\condition2.txt
del %temp%\maxtemp2.txt
del %temp%\mintemp2.txt
goto start

:news
start scripts\xml\getxml.exe -N --directory-prefix=%temp% http://feeds.bbci.co.uk/news/rss.xml
:newscheck
if NOT EXIST %temp%\rss.xml (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto newscheck
)
start scripts\news\parsebbcnews.vbs
ping 123.45.67.89 -n 1 -w 500 > nul.
:newsxmlparsecheck
if NOT EXIST %temp%\bbcnews.txt (
ping 123.45.67.89 -n 1 -w 500 > nul.
goto newsxmlparsecheck
)
set /p headline= <%temp%\bbcnews.txt
echo %headline%
%speech% "%headline%"
del %temp%\rss.xml
del %temp%\bbcnews.txt
goto start
