::This batch script will take over the explorer.exe process
::using your dotted (admin) account.  When finished, the 
::script will kill the logged in admin session and return
::the exporer shell to the normal user.  You must pay very
::close attention to the screen.  It will ask for credentials
::of specific accounts at certain points.  Ensure you enter
::the proper passwords when asked.
::Coded by Jason Chapell 20140417

@echo off
Title Keep Me Open
:Credentials
::Set credentials to use
set /p Admin=Please enter your dotted account name:
::set /p AdminPWD=Please enter your admin password:
set /p User=Please enter your LanID:
::set /p UserPWD=Please enter your Lan Password:
:Start
color f0
cls
::Basic Menu
ECHO *******************************
ECHO        Things you can do     
ECHO *******************************
ECHO   1. Start Explorer as Admin
ECHO   2. ReStart Explorer as User(User/PWD)
ECHO   3. ReStart Explorer as User(SmartCard)
ECHO   4. Start CMD as Admin
ECHO   5. Start File as Admin
ECHO   9. Exit
ECHO *******************************
set /p choice=Please enter a number to continue: 
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto Admin
if '%choice%'=='2' goto User
if '%choice%'=='3' goto SmartCard
if '%choice%'=='4' goto AdminCMD
if '%choice%'=='5' goto AdminFile
if '%choice%'=='9' goto Exit

ECHO *************************
goto start
:Admin
ECHO This will set explorer to admin
::Will kill current explorer.exe process
::runas /user:aa\%Admin% "taskkill /F /IM explorer.exe"
taskkill /F /IM explorer.exe
::Will prompt for password in terminal
runas /user:aa\%Admin% explorer.exe
goto Start
:User
ECHO This will set the explorer back to user
::Will kill current explorer.exe process
runas /user:aa\%Admin% "taskkill /F /IM explorer.exe"
::Will prompt for password in terminal
runas /user:aa\%User% explorer.exe
goto Start
:SmartCard
ECHO Testing New Stuff
ECHO This will set the explorer back to user
::Will kill current explorer.exe process
runas /user:aa\%Admin% "taskkill /F /IM explorer.exe"
::Will prompt for password in terminal
runas /smartcard explorer.exe
goto Start
:AdminCMD
ECHO This will launch a command prompt as admin
::Will prompt for password in terminal
runas /user:aa\%Admin% "c:\Windows\System32\cmd.exe
goto Start
:AdminFile
ECHO This is to run a file with admin credentials
set /p FilePath=Please enter the path to the file:
::Will prompt for password in terminal
runas /user:aa\%Admin% "%FilePath%"
goto Start
:Exit
Exit
