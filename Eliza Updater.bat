@echo off
:: STARTUP
title Eliza Updater
set ElizaVer=1.6.9
:copy-file
title Eliza File Manager © ~ Gestione File: Copia file/cartelle
echo Indica il percorso della cartella appena scaricata:
echo Se il percorso contiene spazi rinominare la cartella altrimenti il processo non andrà a buon fine
set /p "downdir= "
if '%downdir%' == '' echo Sintassi/directory inestistente riprovare && goto copy-file
goto prosegui1

:prosegui1
pause
cd %downdir%
copy /b /v /y  Eliza.bat C:\ElizaFile
pause
:finish
echo Eliza Aggiornata!
cd C:\ElizaFile 
start Eliza.bat
