@echo off
:: STARTUP
title Eliza Setup 1.2.5
set ElizaVer=1.2.5
goto Create-dir

:Create-dir
cd C:\
mkdir ElizaFile
:copy-file
title Eliza File Manager © ~ Gestione File: Copia file/cartelle
echo Indica il percorso della cartella appena scaricata:
set /p "downdir= "
if '%downdir%' == '' echo Sintassi/directory inestistente riprovare && goto copy-file
cd %downdir%
echo.
:prosegui1
copy /b Eliza.bat C:\ElizaFile
:folder-scripts
cd C:\ElizaFile
mkdir scripts
cd..
cd %downdir%
set f-scripts=scripts
set f-dir-scripts=C:\ElizaFile\scripts
echo.
copy /b /v %f-scripts% %f-dir-scripts%
:sub-folder-news
cd C:\ElizaFile\scripts
mkdir news
cd..
cd %downdir%
cd scripts
set f-scripts-news=news
set f-dir-news=C:\ElizaFile\scripts\news
copy /b /v %f-scripts-news% %f-dir-news%
:sub-folder-speech
cd C:\ElizaFile\scripts
mkdir speech
cd..
cd %downdir%\scripts\speech
copy /b /v SwiftTTSEngine.dll C:\ElizaFile\scripts\speech
copy /b /v swift.exe C:\ElizaFile\scripts\speech
copy /b /v swift.dll C:\ElizaFile\scripts\speech
copy /b /v CepstralLicSrv.exe C:\ElizaFile\scripts\speech
copy /b /v ceplex_uk.dll C:\ElizaFile\scripts\speech
copy /b /v ceplang_en.dll C:\ElizaFile\scripts\speech
cd C:\ElizaFile\scripts\speech
mkdir Lawrence
cd %downdir%\scripts\speech
copy /b /v Lawrence C:\ElizaFile\scripts\speech\Lawrence
:sub-folder-spotify
cd C:\ElizaFile\scripts
mkdir spotify
cd..
cd %downdir%
cd scripts
set f-scripts-spotify=spotify
set f-dir-spotify=C:\ElizaFile\scripts\spotify
copy /b /v %f-scripts-spotify% %f-dir-spotify%
:sub-folder-weather
cd C:\ElizaFile\scripts
mkdir weather
cd..
cd %downdir%
cd scripts
set f-scripts-weather=weather
set f-dir-weather=C:\ElizaFile\scripts\weather
copy /b /v %f-scripts-weather% %f-dir-weather%
:sub-folder-xml
cd C:\ElizaFile\scripts
mkdir xml
cd..
cd %downdir%
cd scripts
set f-scripts-xml=xml
set f-dir-xml=C:\ElizaFile\scripts\xml
copy /b /v %f-scripts-xml% %f-dir-xml%
:finish
cd %downdir%
copy /b /v Eliza.lnk C:\ElizaFile
copy /b /v Eliza.lnk %userprofile%\Desktop
cd..
echo Vuoi che Eliza si avvi in automatico ad ogni accensione del sistema?
echo S/N
choice /c SN /n
if %errorlevel% == 1 goto avv
if %errorlevel% == 2 goto n-avv

:n-avv
cd C:\ElizaFile\
mkdir Skip-File
cd Skip File
echo Auto-xavv-disable > Auto-xavv-disable.xavv
cd..
cd C:\
attrib +h ElizaFile
cd C:\ElizaFile
attrib +h scripts
:StartEliza
cd C:\ElizaFile
start Eliza.bat
exit

:avv
cd C:\ElizaFile
mkdir Skip-File
cd Skip-File
echo Auto-xavv-enable > Auto-xavv-enable.xavv
cd..
copy /b /v Eliza.lnk "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
cd C:\
attrib +h ElizaFile
:StartEliza
cd %downdir%
copy /b Eliza.bat C:\ElizaFile
cd..
cd C:\ElizaFile
start Eliza.bat
exit








