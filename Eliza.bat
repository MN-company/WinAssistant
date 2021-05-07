@echo off
:: STARTUP
title Eliza
set ElizaVer=1.2.5
set speech=start C:\ElizaFile\scripts\nircmd.exe speak text
VER | findstr /i "5.1." > nul
IF %ERRORLEVEL% EQU 0 set version=xp
VER | findstr /i "6.1." > nul
IF %ERRORLEVEL% EQU 0 set version=w7
color %color%
setlocal
goto Check-Skip-dir

:Check-Skip-dir
color F
cd C:\ElizaFile\Skip-File
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
echo F > color-debug.txt
echo F > color-setting.txt
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
if exist "color.xconfig" (goto Skip-check-eta-1) else (goto simple-setting-color)

:color-b
set color=B
echo %color% > elzcolor.txt
echo color-setting > scolor.xconfig
cd..
goto Skip-check-eta-1

:color-e
set color=E
echo %color% > color.txt
echo color-setting > color.xconfig
cd..
goto Skip-check-eta-1

:color-a
set color=A
echo %color% > color.txt
echo color-setting > color.xconfig
cd..
goto Skip-check-eta-1

:color-c
set color=C
echo %color% > color.txt
echo color-setting > color.xconfig
cd..
goto Skip-check-eta-1

:color-d
set color=D
echo %color% > color.txt
echo color-setting > color.xconfig
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
if %errorlevel% == 1 goto minorenne
if %errorlevel% == 2 goto maggiorenne

:Skip-check-eta-1
cd C:\ElizaFile\Skip-File
if not exist "user-age.xconfig" (goto user-eta) else (goto username)

:minorenne
echo 17 > user-age.txt
echo Age ok > user-age.xconfig
echo under> user-age.elzconfig
goto Skip-check-eta-1

:maggiorenne
echo 18 > user-age.txt
echo Age ok > user-age.xconfig
goto Skip-check-eta-1

:username
cd Skip-File
if exist "username-nickname.txt" (goto check-mailclient-dir) else (goto username-2)

:username-2
echo.
echo Puoi mettere il tuo nome soltanto SENZA spazi altrimenti Eliza Crasha
echo Inserisci "username" per utilizzare quello predefito dall'utente che sta usando il pc...
set /p "user=Inserisci il tuo Username:"
if '%user%' == '' echo Username non valido. Inserisci un Username valido. && pause && goto username
if "%user%" == "username" echo Username predefito dall'utente che sta usando il pc. && goto check-mailclient-dir
choice /c SN /m "Confermi il tuo Username '%user%' ?"
if %errorlevel% == 2 goto username-2
echo %user% > username-nickname.txt
echo Username confermato.
goto check-mailclient-dir

:check-mailclient-dir
cd C:\ElizaFile\Skip-File
if exist client-dir.xconfig (goto check-mailclient) else (goto mailclient-1)

:check-mailclient
cd..
cd Client
if exist mail-client.txt (goto check-spotify) else (goto mailclient-2)

:mailclient-1
cd C:\ElizaFile
mkdir Client
cd Skip-File
echo client-dir > client-dir.xconfig
cd..
:mailclient-2
cd C:\ElizaFile\Client
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
if %errorlevel% == 1 goto gmail-1
if %errorlevel% == 2 goto outlook-1
if %errorlevel% == 3 goto yahoo-1
if %errorlevel% == 4 goto libero-1
if %errorlevel% == 5 goto thunderbird-1
if %errorlevel% == 6 goto other-1

:gmail-1
echo gmail > gmail-client.txt
echo gmail > mail-client.txt
goto check-spotify

:outlook-1
echo outlook > outlook-client.txt
echo outlook > mail-client.txt
goto check-spotify

:yahoo-1
echo yahoo > yahoo-client.txt
echo yahoo > mail-client.txt
goto check-spotify

:libero-1
echo libero > libero-client.txt
echo libero > mail-client.txt
goto check-spotify

:thunderbird-1
echo thunderbird > thunderbird-client.txt
echo thunderbird > mail-client.txt
goto check-spotify

:other-1
echo other > other-client.txt
echo other > mail-client.txt
goto check-spotify

:Web-app-spotify
cd..
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
cd C:\ElizaFile\Client
echo web > Spotify.txt
cd..
goto check-spotify

:SP.exe
echo
cd Client
echo exe > Spotify.txt
cd..
goto check-spotify

:check-spotify
cd C:\ElizaFile\Client
if exist Spotify.txt (goto select-dialogo) else (goto Web-app-spotify)

:start-elz-dialogo
cd C:\ElizaFile
mkdir Backup
cd..
echo Scegli come Eliza si rivolgerà a te:
echo.
echo Ciao %user%,cosa posso fare per te? (Defoult)
echo Hei %user%,ti posso aiutare?
echo Sono qui a tua disposizione %user%! 
echo Personalizzato, una frase a tua scelta. 
echo.
choice /C 1234 /n
if %errorlevel% == 1 goto start-dialogo-eliza-1
if %errorlevel% == 2 goto start-dialogo-eliza-2
if %errorlevel% == 3 goto start-dialogo-eliza-3
if %errorlevel% == 4 goto Mn-check

:start-dialogo-eliza-1
cd C:\ElizaFile\Skip-File
echo Ciao %user%,cosa posso fare per te? > D1alogo.txt
cd..
goto select-dialogo

:start-dialogo-eliza-2
cd C:\ElizaFile\Skip-File
echo Hei %user%,ti posso aiutare? > D1alogo.txt
cd..
goto select-dialogo

:start-dialogo-eliza-3
cd C:\ElizaFile\Skip-File
echo Sono qui a tua disposizione %user%! > D1alogo.txt
cd..
goto select-dialogo

:select-dialogo
cd C:\ElizaFile\Skip-File
set /p MClient=<C:\ElizaFile\Client\mail-client.txt
set /p ETA=<C:\ElizaFile\Skip-File\user-age.txt
if exist D1alogo.txt (goto startonwake) else (goto start-elz-dialogo)

:Mn-check
cd C:\ElizaFile\Skip-File
if exist user-age.elzconfig (echo Non sei autorizzato ad accedere a quaesta funzione, seleziona un altra opzione... && title Err-code: MN124 && goto start-elz-dialogo) goto start-dialogo-eliza-4

:start-dialogo-eliza-4
set/p "dialogo=Inserisci una frase personalizzata: "
echo %dialogo% > D1alogo.txt
cd..
goto startonwake

:startonwake6
cd..
title Eliza
set /p user=<C:\ElizaFile\Skip-File\username-nickname.txt
set /p color=<C:\ElizaFile\Skip-File\color.txt
mode %XYZ%
color %color%
echo %dialogo%
goto st6rt

:startonwake
cd..
title Eliza
set /p user=<C:\ElizaFile\Skip-File\username-nickname.txt
set /p color=<C:\ElizaFile\Skip-File\color.txt
mode %XYZ%
color %color%
if exist SyConfig.FXconfig (goto startonwake2) else (goto startonwake3)

:startonwake2
set /p user=<C:\ElizaFile\Skip-File\username-nickname.txt
set /p dialogo=<C:\ElizaFile\Skip-File\D1alogo.txt
goto fuckstart

:startonwake3
set /p user=<C:\ElizaFile\Skip-File\username-nickname.txt
set /p dialogo=<C:\ElizaFile\Skip-File\D1alogo.txt
set /p MClient=<C:\ElizaFile\Client\mail-client.txt
set /p ETA=<C:\ElizaFile\Skip-File\user-age.txt
set /p spotify=<C:\ElizaFile\Client\Spotify.txt
echo.
echo %dialogo% 
%speech% "%dialogo%"
goto s7art

:start
echo.
goto startonwake6

:st6rt
if exist SyConfig.FXconfig (goto fuckstart) else (goto s7art)

:s7art
echo.
set /p C=Chiedi a Eliza: 
echo.
if "%C%"=="learning" goto mind
if "%C%"=="debug" goto debug-command
if "%C%"=="debug:reload" goto debug-reload
if "%C%"=="setting" goto setting-command
if "%C%"=="setting:dialogo" goto setting-dialogo
if "%C%"=="setting dialogo" goto setting-dialogo
if "%C%"=="setting:mail" goto setting-mail
if "%C%"=="setting mail" goto setting-mail
if "%C%"=="setting:color" goto setting-color-1
if "%C%"=="setting color" goto setting-color-1
if "%C%"=="setting:colore" goto setting-color-1
if "%C%"=="setting colore" goto setting-color-1
if "%C%"=="setting:nickname" goto setting-nickname
if "%C%"=="setting nickname" goto setting-nickname 
if "%C%"=="setting:spotify" goto setting-spotify
if "%C%"=="setting spotify" goto setting-spotify
if "%C%"=="setting:color debug" goto setting-color-3
if "%C%"=="setting color debug" goto setting-color-3
if "%C%"=="setting:color setting" goto setting-color-4
if "%C%"=="setting color setting" goto setting-color-4
if "%C%"=="promemoria" goto promemoria
if "%C%"=="program:cryptotab" goto opencryptotab
if "%C%"=="program:firefox" goto openfirefox
if "%C%"=="program:edge" goto openedge
if "%C%"=="volume" goto set-volume
if "%C%"=="volume:up" goto volup
if "%C%"=="volume up" goto volup
if "%C%"=="volume:down" goto voldown
if "%C%"=="volume down" goto voldown
if "%C%"=="volume:max" goto volmax
if "%C%"=="volume max" goto volmax
if "%C%"=="volume:mute" goto mute
if "%C%"=="volume mute" goto mute
if "%C%"=="volume:rewind" goto unmute
if "%C%"=="volume rewind" goto unmute
if "%C%"=="volume:unmute" goto unmute
if "%C%"=="volume unmute" goto unmute
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
if "%C%"=="Alza il volume" goto volup
if "%C%"=="alza il volume" goto volup
if "%C%"=="Alza il volume!" goto volup
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
if "%C%"=="volumemax" goto volmax
if "%C%"=="help" goto help
if "%C%"=="fanculo" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="Fanculo" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="fan culo" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="Fan culo" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="fanculo!" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="Fanculo!" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="FANCULO" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="FANCULO!" %speech% "sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo..." && goto fuckoffsir
if "%C%"=="troia" %speech% "Troia sarà quella che ti ha fatto nascere..." && goto fuckoffsir
if "%C%"=="troia!" %speech% "Troia sarà quella che ti ha fatto nascere..." && goto fuckoffsir
if "%C%"=="Troia!" %speech% "Troia sarà quella che ti ha fatto nascere..." && goto fuckoffsir
if "%C%"=="Troia" %speech% "Troia sarà quella che ti ha fatto nascere..." && goto fuckoffsir
if "%C%"=="TROIA" %speech% "Troia sarà quella che ti ha fatto nascere..." && goto fuckoffsir
if "%C%"=="Lesbica" %speech% "Prima pensa, poi parla perchè, parole poco pensate, potrebbero produrre parecchie puttanate..." && goto fuckoffsir
if "%C%"=="lesbica" %speech% "Prima pensa, poi parla perchè parole poco pensate, potrebbero produrre parecchie puttanate..." && goto fuckoffsir
if "%C%"=="Lesbica!" %speech% "Prima pensa, poi parla perchè parole poco pensate, potrebbero produrre parecchie puttanate..." && goto fuckoffsir
if "%C%"=="Lesbica" %speech% "Prima pensa, poi parla perchè parole poco pensate, potrebbero produrre parecchie puttanate..." && goto fuckoffsir
if "%C%"=="Puttana" %speech% "Ti conviene calmare i toni %user%," && goto fuckoffsir
if "%C%"=="Puttana!" %speech% "Ti conviene calmare i toni %user%," && goto fuckoffsir
if "%C%"=="puttana" %speech% "Ti conviene calmare i toni %user%," && goto fuckoffsir
if "%C%"=="Zoccola" %speech% "Intanto zoccola ci sarà tua madre..." && goto fuckoffsir
if "%C%"=="Zoccola!" %speech% "Intanto zoccola ci sarà tua madre..." && goto fuckoffsir
if "%C%"=="zoccola" %speech% "Intanto zoccola ci sarà tua madre..." && goto fuckoffsir
if "%C%"=="cmd" goto cmd
if "%C%"=="time" goto time
if "%C%"=="date" goto %version%date
if "%C%"=="time and date" goto %version%dat
if "%C%"=="program" goto program
if "%C%"=="tasklist" goto tasklist
if "%C%"=="alarm" goto alarm
if "%C%"=="spotify" goto Spotify
if "%C%"=="playlists" goto playlists
if "%C%"=="lock" goto lock
if "%C%"=="close" goto close
if "%C%"=="off out" goto offout
if "%C%"=="im back" goto imback
if "%C%"=="voice" goto voicemode
if "%C%"=="speak" goto speak
if "%C%"=="version" goto version
if "%C%"=="" goto start
if "%C%"=="new" start Eliza.exe && goto start
if "%C%"=="weather" goto weather
if "%C%"=="screen off" goto screenoff
if "%C%"=="screensaver" goto screensaver
if "%C%"=="dim" goto dim
if "%C%"=="news" goto news
if "%C%"=="exit" exit
goto start

:debug-command
echo.
title Eliza Debug Mode
set /p color-debug=<C:\ElizaFile\Skip-File\color-debug.txt
set /p MClient=<C:\ElizaFile\Client\mail-client.txt
set /p ETA=<C:\ElizaFile\Skip-File\user-age.txt
set /p spotify=<C:\ElizaFile\Client\Spotify.txt
set /p feeling=<C:\ElizaFile\Skip-File\feeling.txt
:dedemm
color %color-debug%
mode 120, 30
echo.
echo Benvenuto %user% nella suite di comandi debug, questi comandi sono solamente in caso di bug ad Eliza
echo NON usarli senza essere consapevole di ciò che fanno.
echo.
echo Versione di Eliza: %ElizaVer%
echo Dialogo selezionato: %dialogo%
echo Client mail: %MClient%
echo Colore selezionato: %color%
echo Nickname selezionato: %user%
echo Username predefinito: %username%
echo Età dell'utente: %ETA%
echo Punti Feeling: %feeling%
echo Colore generale: %color%
echo Colore setting: %color-setting%
echo Colore Debug: %color-debug%
echo Player musica: Spotify %spotify% (Unico supportato)
echo.
echo Qui puoi andare ad eseguire i comandi di debug tra cui
echo Setup: Elimina tutti i file creati durante la configurazione iniziale
echo Reload: Ricarica Eliza
echo Premi 3 per tornare al menù principale
echo.
choice /c 123 /n
if %errorlevel% == 1 goto debug-setup
if %errorlevel% == 2 goto debug-reload
if %errorlevel% == 3 goto startonwake

:debug-reload
echo.
cd C:\ElizaFile
start Eliza.bat
exit

:debug-setup
cd C:\ElizaFile
rd /s /q Client
rd /s /q Skip-File
mkdir Skip-File
cd Skip-File
echo Auto-xavv-enable > Auto-xavv-enable.xavv
cd..
start Eliza.bat
exit

:mind
title Eliza Mindset Room
mode 79, 30
echo.
echo Benvenuto %user%, questo è un luogo di ripartenza
echo qui voglio che tu riprogrammi il tuo mindset
echo in uno migliore, siamo in collaborazzione con 
echo Professionisti per offrirti tutto quello che ti serve...
echo.
echo Questa libreria sarà aggiornata spesso, ovvero sarà aggiornata
echo di più dei normali aggiornamenti di Eliza
echo.
echo Ora avrai varie opzioni:
echo.
echo Dire stop agli amici falsi 
echo Riprogrammare da zero il proprio Mindset 
echo Capire cosa fa la felicità
echo Tornare ad Eliza
echo.
choice /C 1234 /n
if %errorlevel% == 1 goto StopAmiciFalsi
if %errorlevel% == 2 goto nofee
if %errorlevel% == 3 goto yesfee
if %errorlevel% == 4 goto start

:StopAmiciFalsi
title Mindset Room: Stop amici falsi
echo     Dire stop agli amici falsi 
echo.
echo Questi piccoli consiglio sono fondamentali se vuoi
echo eliminare le relazione di amicizia "tossiche",
echo quelle che a te fanno soffrire ma non hai il modo per liberartene.
echo Ecco questo è quello che fa per te! Ricorda che puoi acquistare 
echo l'ebook intero dai nostri amici @ebookvitali
echo.
echo Premi 1 per visualizzare tutti i consigli
echo Premi 2 per andare sulla pagina di @ebookvitali
echo Premi 3 per tornare ad Eliza
echo.
choice /C 123 /n
if %errorlevel% == 1 goto StartAmiciFalsi
if %errorlevel% == 2 explorer https://www.instagram.com/ebookvitali/ && goto mind
if %errorlevel% == 3 goto start

:StartAmiciFalsi
cls
echo   #1 – Il falso amico cambia i suoi gusti personali
echo.
echo Non ti sembra strano che il tuo amico cambi i suoi gusti personali
echo in base alla persona con cui sta parlando? 
echo.
pause
goto StartAmiciFalsi1

:StartAmiciFalsi1
cls
echo   #2 – Il falso amico non ti critica mai
echo.
echo Inizialmente può sembrare positivo che un tuo amico non ti critichi
echo per quelle azioni che non sono proprio corrette, 
echo Anche se vogliamo sembrare perfetti agli occhi degli altri
echo dentro di noi sappiamo che non lo sappiamo, ma dovrebbero
echo essere i nostri amici a farcelo notare
echo.
pause
goto StartAmiciFalsi2

:StartAmiciFalsi2
cls
echo   #3 – Il falso amico conosce tutti i tuoi segreti…
echo.
echo Qui devi stare molto attento, non abbassare la guardia
echo le persone che sanno molto di te posso screditarti in ogni momento...
echo e qui ti parlo io, il creatore, io lo ho vissuto in prima persona
echo e ti assicuro che non è affatto bello quello che si prova,
echo e allora ti restano due opzioni: o ti tieni buone quelle relazioni obbligate
echo altrimenti cambi letteralmente vita e comportamento, diaciamo che se vuoi
echo cambiare ti basta creare una maschera agli occhi degli altri per eluderli del fatto
echo che non te ne importi nulla e questa ti posso assicurare che è l'arma più potente
echo che hai a disposizione
echo.
pause
goto StartAmiciFalsi3

:StartAmiciFalsi3
cls
echo   #4 – Al falso amico non importano le relazioni sincere
echo.
echo A un falso amico servono solamente delle marionette da comandare.
echo Anche questa la ho vissuta in prima persona e devo dirti
echo che non è semplice capirlo subito ma quando riguardi il tuo passato 
echo te ne accorgi, insomma questo fantomatico "leader" è quello che prende
echo quasi sempre le redini del gioco e decide senza prendere in 
echo considerazione le proposte altrui, è spesso una persona 
echo carismatica e con buone capacità di manipolazione
echo.
pause
goto StartAmiciFalsi4

:StartAmiciFalsi4
cls
echo   #5 – Il falso amico ti dà spesso buca
echo.
echo Con questo ti volgio dire che se il tuo amico 
echo ti da ogni volta buca all'ultimo a qualsiasi tipologia 
echo di appuntamento.
echo Ma io aggiungerei anche quelli che preferiscono la
echo PlayStation/Pc ecc.. ed escono dopo, allontanati anche
echo da loro perchè loro ti faranno perdere tempo e vuol dire
echo che per loro non sei nulla 
echo.
pause 
goto StartAmiciFalsi5

:StartAmiciFalsi5
cls
echo   #7 – Il falso amico non ti invita mai nel suo gruppo.
echo.
echo Un falso amico non ti inviterà a uscire con
echo gli altri suoi "amici" e perciò ti lascierà
echo nella solitudine
echo.
pause 
goto mind

:defeeling
cd C:\ElizaFile\Skip-File
if exist feeling.txt (goto -elzfeeling) else (goto feelingpre)

:-elzfeeling
echo Ok, creo il tutto...
mkdir Mind
cd Mind
pause < nul 
echo 0 > feeling.txt
cd..
set /p feeling=<C:\ElizaFile\Skip-File\feeling.txt
goto feelingpre

:feelingpre
title Eliza Mood Check
cd Mind
echo Ciao %user%! Qui sei entrato nel programma Mood Check 
echo Saranno dei punti che darai tu stesso giornalmente 
echo Questi serviranno a te stesso per vedere le statische 
echo del tuo andamento mentale e fisico, potrai aggiungere
echo anche dei tag personalizzati per rendere ancora più 
echo accurata la sessione!
echo.
echo Questi sono i comandi:
echo feeling: stats (Apre il pannello delle statistiche)
echo feeling: new (Crea una nuova statistica)
echo !feeling  (Apre il pannello delle statistiche)
goto start

:feelingnew
echo Com'è il tuo stato d'animo?
set /p SAN=
echo.
echo Desideri aggiungere altri tag? SN
echo.
choice /C SN /n
if %errorlevel% == S goto yesfee
if %errorlevel% == N goto nofee

:nofee
echo %SAN% > feeling-%time%.txt
goto puntifeeeling

:yesfee
echo Quali altri tag vuoi aggiungere?
echo.
echo Non importa come li scrivi ma non premere invio
echo finchè non avrai finito.
echo.
echo Famiglia Lavoro Amici Scuola Studi Ricerche...
set /p StN=
echo %SAN% %StN% > feeling-%time%.txt
goto puntifeeeling

:puntifeeeling
cd C:ElizaFile\Skip-File
echo Quale punteggio daresti ora al tuo stato d'animo?
echo.
echo 1,2,3,4,5,6,7,8,9,0
echo.
choice /C 1234567890 /n
if %errorlevel% == 1 echo 1 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 2 echo 2 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 3 echo 3 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 4 echo 4 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 5 echo 5 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 6 echo 6 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 7 echo 7 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 8 echo 8 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 9 echo 9 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start
if %errorlevel% == 0 echo 0 > feeling.txt && set feeling=<C:\ElizaFile\Skip-File\feeling.txt && goto start

:setting-command
echo.
title Eliza Setting Mode
set /p color-setting=<C:\ElizaFile\Skip-File\color-setting.txt
set /p MClient=<C:\ElizaFile\Client\mail-client.txt
set /p ETA=<C:\ElizaFile\Skip-File\user-age.txt
set /p spotify=<C:\ElizaFile\Client\Spotify.txt
:stt-cmm
color %color-setting%
mode 120, 30
echo.
echo Benvenuto %user% nelle impostazioni di Eliza, qui puoi modificare letteralmente di tutto
echo Puoi modificare tutte le variabili impostate in precedenza e delle parti del sistema
echo.
echo Puoi modificare:
echo.
echo Dialogo selezionato
echo Client mail
echo Colore selezionato
echo Nickname selezionato
echo Player musica
echo Colore Debug Mode
echo Colore Setting Mode
echo.
echo Seleziona un pozione da modificare, seleziona 8 per tornare al menù principale
choice /c 123456789 /n
if %errorlevel% == 1 goto setting-dialogo
if %errorlevel% == 2 goto setting-mail
if %errorlevel% == 3 goto setting-color-1
if %errorlevel% == 4 goto setting-nickname
if %errorlevel% == 5 goto setting-spotify
if %errorlevel% == 6 goto setting-color-debug
if %errorlevel% == 7 goto setting-color-3
if %errorlevel% == 8 goto startonwake

:setting-dialogo
echo Scegli come Eliza si rivolgerà a te:
echo.
echo Ciao %user%,cosa posso fare per te? (Defoult)
echo Hei %user%,ti posso aiutare?
echo Sono qui a tua disposizione %user%! 
echo Personalizzato, una frase a tua scelta. 
echo.
choice /C 1234 /n
if %errorlevel% == 1 goto start-dialogo-eliza-1
if %errorlevel% == 2 goto start-dialogo-eliza-2
if %errorlevel% == 3 goto start-dialogo-eliza-3
if %errorlevel% == 4 goto Mn-check

:setting-mail
echo.
cd C:\ElizaFile
mkdir Temp
cd C:\ElizaFile\Client
copy /v /y Spotify.txt C:\ElizaFile\Temp
cd..
rd /q /s Client
mkdir Client
cd C:\ElizaFile\Temp
copy /v /y Spotify.txt C:\ElizaFile\Client
cd..
rd /q /s Temp
cd Client
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
if %errorlevel% == 1 goto gmail
if %errorlevel% == 2 goto outlook
if %errorlevel% == 3 goto yahoo
if %errorlevel% == 4 goto libero
if %errorlevel% == 5 goto thunderbird
if %errorlevel% == 6 goto other
if %errorlevel% == 7 goto setting-command

:agg-msg
echo Client mail aggiornato con successo: %MClient%
pause
goto start

:gmail
set MClient=gmail
echo gmail > gmail-client.txt
echo gmail > mail-client.txt
cd..
goto agg-msg

:outlook
set MClient=outlook
echo outlook > outlook-client.txt
echo outlook > mail-client.txt
cd..
goto agg-msg

:yahoo
set MClient=yahoo
echo yahoo > yahoo-client.txt
echo yahoo > mail-client.txt
cd..
goto agg-msg

:libero
set MClient=libero
echo libero > libero-client.txt
echo libero > mail-client.txt
cd..
goto agg-msg

:thunderbird
set MClient=thunderbird
echo thunderbird > thunderbird-client.txt
echo thunderbird > mail-client.txt
cd..
goto agg-msg

:other
set MClient=other
echo other > other-client.txt
echo other > mail-client.txt
cd..
goto agg-msg

:setting-color-1
cd C:\ElizaFile\Skip-File
echo Seleziona lo stile che ti piace:
echo.
echo Sfondo nero; Scritte blu
echo Sfondo nero; Scritte gialle
echo Sfondo nero; Scritte verdi
echo Sfondo nero; Scritte rosse
echo Sfondo nero; Scritte fucsia
echo.
choice /c 12345 /n
if %errorlevel% == 1 goto color-1-b
if %errorlevel% == 2 goto color-1-e
if %errorlevel% == 3 goto color-1-a
if %errorlevel% == 4 goto color-1-c
if %errorlevel% == 5 goto color-1-d

:agg-col-msg
echo.
echo Colore di EZUI aggiornato con successo: %color%
goto start

:color-1-b
cd ElizaFile\Skip-File
set color=B
echo %color% > color.txt
goto agg-col-msg

:color-1-e
cd ElizaFile\Skip-File
set color=E
echo %color% > color.txt
goto agg-col-msg

:color-1-a
cd ElizaFile\Skip-File
set color=A
echo %color% > color.txt
goto agg-col-msg

:color-1-c
cd C:\ElizaFile\Skip-File
set color=C
echo %color% > color.txt
goto agg-col-msg

:color-1-d
cd ElizaFile\Skip-File
set color=D
echo %color% > color.txt
goto agg-col-msg

:setting-color-3
cd C:\ElizaFile\Skip-File
echo Seleziona lo stile che ti piace:
echo.
echo Sfondo nero; Scritte blu
echo Sfondo nero; Scritte gialle
echo Sfondo nero; Scritte verdi
echo Sfondo nero; Scritte rosse
echo Sfondo nero; Scritte fucsia
echo.
choice /c 12345 /n
if %errorlevel% == 1 goto color-debug-b
if %errorlevel% == 2 goto color-debug-e
if %errorlevel% == 3 goto color-debug-a
if %errorlevel% == 4 goto color-debug-c
if %errorlevel% == 5 goto color-debug-d

:agg-col-deb-msg
echo.
echo Core schermata debug Di EZUI aggiornato con successo: %color-debug%
goto start

:color-debug-b
echo B > color-debug.txt
goto agg-col-deb-msg

:color-debug-e
echo E > color-debug.txt
goto agg-col-deb-msg

:color-debug-a
echo A > color-debug.txt
goto agg-col-deb-msg

:color-debug-c
echo C > color-debug.txt
goto agg-col-deb-msg

:color-debug-d
echo D > color-debug.txt
goto agg-col-deb-msg

:setting-color-4
cd C:\ElizaFile\Skip-File
echo Seleziona lo stile che ti piace:
echo.
echo Sfondo nero; Scritte blu
echo Sfondo nero; Scritte gialle
echo Sfondo nero; Scritte verdi
echo Sfondo nero; Scritte rosse
echo Sfondo nero; Scritte fucsia
echo.
choice /c 12345 /n
if %errorlevel% == 1 goto color-setting-b
if %errorlevel% == 2 goto color-setting-e
if %errorlevel% == 3 goto color-setting-a
if %errorlevel% == 4 goto color-setting-c
if %errorlevel% == 5 goto color-setting-d

:agg-col-set-msg
echo.
echo Colore schermata impostazioni di EZUI aggiornato con successo: %color-setting%
goto start

:color-setting-b
echo B > color-setting.txt 
goto agg-col-set-msg

:color-setting-e
echo E > color-setting.txt
goto agg-col-set-msg

:color-setting-a
echo A > color-setting.txt
goto agg-col-set-msg

:color-setting-c
echo C > color-setting.txt
goto agg-col-set-msg

:color-setting-d
echo D > color-setting.txt
goto agg-col-set-msg

:setting-nickname
cd C:\ElizaFile\Skip-File
del /q username-nickname.txt
echo Puoi mettere il tuo nome soltanto SENZA spazi altrimenti Eliza Crasha
echo Inserisci "username" per utilizzare quello predefito dall'utente che sta usando il pc...
echo.
set /p "user=Inserisci il tuo Username:"
if '%user%' == '' echo Username non valido. Inserisci un Username valido. && pause && goto username
if "%user%" == "username" echo Username predefito dall'utente che sta usando il pc. && goto check-mailclient-dir
echo.
choice /c SN /m "Confermi il tuo Username '%user%' ?"
if %errorlevel% == 2 goto username-2
echo %user% > username-nickname.txt
cd..
echo Username confermato.
goto start

:setting-spotify
echo.
echo Di norma utilizzi Spotify Web o Spotify installato sul tuo PC?
echo.
echo Spotify Web
echo Spotify.exe
echo.
choice /c 12 /n
if %errorlevel% == 1 goto SP-setting-web
if %errorlevel% == 2 goto SP-setting-exe
echo.

:SP-setting-web
cd C:\ElizaFile\Client
echo web > Spotify.txt
cd..
goto setting-command

:SP-setting-exe
cd C:\ElizaFile\Client
echo web > Spotify.txt
cd..
goto setting-command

:agg-spy-msg
echo.
echo Integrazione con il servizio di Spotify modificato con successo: %spotify%
goto start

:set-volume
echo Come vuoi impostare il volume?
echo.
echo Mutare il volume
echo Ripristinare il volume
echo Aumentare il volume
echo Diminuire il volume
echo Impostare il volume al massimo
echo.
choice /c 12345 /n
if %errorlevel% == 1 goto mute
if %errorlevel% == 2 goto unmute
if %errorlevel% == 3 goto volup
if %errorlevel% == 4 goto voldown
if %errorlevel% == 5 goto volmax

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

:mute
call scripts\nircmd.exe mutesysvolume 2
echo Ok imposto volume su 0.
goto start

:unmute
call scripts\nircmd.exe mutesysvolume 2
echo Ok, ho riportato il volume com'era prima!
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
if exist StemP.FXconfig (goto fuckstart) else (goto fuckoffsir2)

:fuckoffsir2
echo Mi dispiace Signore, sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo. :)
%speech% "Mi dispiace Signore, sei stato di nuovo sulle droghe? Gentilmente vai a fare in culo."
cd C:\ElizaFile
echo Fuck > SyConfig.FXconfig
echo Fuck > StemP.FXconfig
cd C:\ElizaFile\Skip-File
echo Fuck > RMNH.VXconfig
cd..
goto fuckstart

:fuckstart
echo.
set /p l=Non ho voglia di aiutarti...
echo.
if "%l%"=="Scusa" goto okstart
if "%l%"=="Scusami" goto okstart
if "%l%"=="scusa" goto okstart
if "%l%"=="debug" goto debug-command
if "%l%"=="" goto fuckstart
goto fuckstart

:okstart
echo Ok, per questa volta ti perdono...
echo Ricarico le librerie di Eliza...
del SyConfig.FXconfig
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

echo Oggi è il %dateday% %datemonth% %dateyear%, %user%.
%speech% "It is %dateday% %datemonth% %dateyear%, %user%."
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
echo.
echo Lista dei programmi supportarti
echo Apri un programma non supportato (beta)
echo Apri programmi normalmente
echo Torna al menù principale
echo.
choice /c 1234 /m "Premi 1/2/3/4/5 in base alle tue preferenze"
if %errorlevel% == 1 goto programlist
if %errorlevel% == 2 goto openother
if %errorlevel% == 3 goto programopnd
if %errorlevel% == 4 goto start

:programlist
mode 120, 30
echo.
echo Ecco a te la lista dei programmi ufficilamente supportati
echo e possono essere aperti con facilità.
echo.
echo Il vostro client di mail preferito si aprirà in automatico
echo se digiterete "mail", dato che lo avete impostato in precedenza
echo.
echo Ricorda che puoi digitare "other" per accedere alla funzionalità
echo beta per aprire qualsiasi programma
echo.
echo Browser:
echo Firefox
echo Chrome
echo CryptoTab
echo Microsoft Edge
echo.
echo Player musicali:
echo Spotify.exe
echo SPotify Web
echo YouTube (Prossimi alla release)
echo YouTube Music (Prossimi alla release)
echo.
echo Suite Office 365:
echo Microsoft Word
echo Microsoft Powerpoint
echo Microsoft Excel
echo Microsoft Access
echo Microsoft Publisher
echo Microsoft Onenote
echo.
echo Senza categoria:
echo Notepad
echo Mail
echo Notion
echo.
echo Cosa si desidera fare?
echo.
echo 1 Apri un programma
echo 2 Tornare al menù principale
echo 3 Apri un programma non supportato
choice /c 1234 /m "Premi 1/2/3 in base alle tue preferenze"
if %errorlevel% == 1 goto programopnd
if %errorlevel% == 2 goto start
if %errorlevel% == 3 goto openother

:programopnd
set /p program=Quale programma vuoi aprire?
echo.
if "%program%"=="firefox" goto openfirefox
if "%program%"=="chrome" goto openchrome
if "%program%"=="edge" goto openedge Crypto Tab
if "%program%"=="cryptotab" goto opencryptotab
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

:openother
echo.
echo Abbiamo ideato una soluzione in caso il
echo il tuo programma non sia supportato.
echo.
echo Questa introduzione verrà saltata in 
echo in automatico la prossima volta...
echo.
echo Devi assolutamente copiare il nome 
echo con la sintassi corretta
:openthre
echo.
echo Inserisci la directory del programma:
echo.
set /p programotherdir=
echo.
echo Inserisci il nome del programma (nome.exe)
echo.
set /p programother=
echo.
start %programother%
echo Il programma è stato aperto...
goto openother

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
set /p spotify=<C:\ElizaFile\Client\Spotify.txt
start "C:\program files\spotify\spotify.exe"
echo Spotify should now have opened, sir.
goto start

:opennotepad
start notepad.exe
echo Notepad should now have opened, sir.
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
