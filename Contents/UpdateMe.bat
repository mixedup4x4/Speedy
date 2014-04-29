::Used to update files as needed or as I "feel" like working on something
@ECHO off
Title Update some things
color 02
cls
:start
Title Update some things
@echo off
color 02
cls
ECHO *************************
ECHO *************************
ECHO     Things you can do     
ECHO *************************
ECHO *************************
ECHO   1. Do Updates
ECHO   2. Exit
ECHO *************************
set /p choice=Please enter a number to continue: 
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto Update
if '%choice%'=='2' goto End
if '%choice%'=='9' goto Development
ECHO *************************
goto start
:Update
@echo off
cls
if not exist c:\Users\Public\Temp mkdir c:\users\Public\Temp
copy /Y *.* C:\Users\%USERNAME%\Desktop\CmdTools
del C:\Users\%USERNAME%\Desktop\CmdTools\UpdateMe.bat
del C:\Users\%USERNAME%\Desktop\CmdTools\*.pyc
echo Your files have been updated
goto End
:End
@echo off
cd ".."
Erase Update.zip
RD /S /Q Update
pause
Exit
:Development
@echo off
cls
copy /Y *.* C:\Users\%USERNAME%\Desktop\CmdTools
del C:\Users\%USERNAME%\Desktop\CmdTools\UpdateMe.bat
echo Your files have been updated
pause
Exit