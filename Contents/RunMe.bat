::***********************************************************************
::*                       Created by Jason Chapell                      *
::*                   For use by the NSOC SECURITY team                 *
::*                        chapell.jason@epa.gov                        *
::***********************************************************************

@ECHO off
Title Simplified Tasks
color 02
cls
:start
Title Simplified Tasks
@echo off
color 02
cls
ECHO *************************
ECHO *************************
ECHO     Things you can do     
ECHO *************************
ECHO *************************
ECHO   1. Validate Proxies
ECHO   2. AutoMater
ECHO   3. Blackhole (Uses SSH)
ECHO   5. Dress (Uses SSH)
ECHO   7. SetUp
ECHO   8. HashChecker (WIP)
ECHO   9. Exit
ECHO   999. ChangeLog
ECHO *************************
set /p choice=Please enter a number to continue: 
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto ValidateProxies
if '%choice%'=='2' goto Automater
if '%choice%'=='3' goto BlackholeSSH
if '%choice%'=='4' goto BlackholePutty
if '%choice%'=='5' goto DressSSH
if '%choice%'=='6' goto DressPutty
if '%choice%'=='7' goto Setup
if '%choice%'=='8' goto WIP
if '%choice%'=='9' goto End
if '%choice%'=='999' goto ChangeLog
ECHO *************************
goto start
:ValidateProxies
@echo off
cls
Title ProxyTester
Color 1F
Echo This will test your list of proxies and generate a working list
ProxyTester3.py proxies.txt 
copy Working.txt c:\users\%username%\Desktop\Proxies\Working.txt
goto Start
:nodup
cscript  /nologo noDup.vbs
del c:\users\%username%\Desktop\Proxies\Working.txt
del working.txt
Pause
goto start
:AutoMater
:: ********************************************************************
:: ***Created by Jason Chapell to speed up the usage of Automater.py***
:: ************For use within EPA NSOC/NCC by Security Team************
:: ********************************************************************
@echo off
@TITLE Automated Automater
color 0C
cls
echo ******************************************
echo ******************************************
echo ****Welcome to the AutoMated AutoMater****
echo ******************************************
echo ******************************************
echo *
echo *
echo *
echo *
:: * Get File Name
::del c:\Users\Public\Temp\AutoMaterResults.txt
SET /p tix="Enter Remedy Ticket Number: "
SET /p who="What group submitted the BR (CSIRC, NSOC, etc.): "
SET Subj=BR-%tix%
SET File=C:\Users\%USERNAME%\Desktop\BlockRequests\%who%-BR-%tix%.txt
echo Running AutoMater and Setting FileName to BR-%tix%
@echo off
del c:\Users\Public\temp\*.txt
:: * Make Directory to use
:: * Running AutoMater and creating the initial Results file
automater.py --p list.txt -o c:\Users\%USERNAME%\Desktop\BlockRequests\Temp-%tix%.txt
:: * Removing "No Results" lines from Results and creating new file
findstr /v "No results" c:\Users\%USERNAME%\Desktop\BlockRequests\Temp-%tix%.txt > C:\Users\%USERNAME%\Desktop\BlockRequests\%who%-BR-%tix%.txt
:: * Opening finished file
start C:\Users\%USERNAME%\Desktop\BlockRequests\%who%-BR-%tix%.txt
copy C:\Users\%USERNAME%\Desktop\BlockRequests\%who%-BR-%tix%.txt c:\Users\Public\Temp\temp.txt
echo. %who%-BR-%tix%>c:\Users\Public\Temp\%who%-%tix%-BR.txt
type c:\Users\Public\Temp\temp.txt >>c:\Users\Public\Temp\%who%-%tix%-BR.txt
del c:\Users\Public\Temp\temp.txt
:: * Deleting initial file
del c:\Users\%USERNAME%\Desktop\BlockRequests\Temp-%tix%.txt
@echo off
cscript //nologo email2.vbs
pause
goto Start
:wip
ECHO Work In progress!...Check back for updates
pause
goto Start
:Setup
@Echo off
:: Window Style
:: 1 = Normal, 3 Maximized, 7 = Minimized
:: Choose "Desktop" or "AllUsersDesktop"
set Location="Desktop"
set DisplayName="Hashed"
set filename="c:\Users\%USERNAME%\Desktop\Cmdtools\Hashed.txt"
:: Set icon to an icon from an exe or "something.ico"
set icon="notepad.exe, 0"
set WorkingDir="C:\Users\%USERNAME%\Desktop"
set Arguments="xxx"
:: Make temporary VBS file to create shortcut
:: Then execute and delete it
(echo Dim DisplayName,Location,Path,shell,link
echo Set shell = CreateObject^("WScript.shell"^)
echo path = shell.SpecialFolders^(%Location%^)
echo Set link = shell.CreateShortcut^(path ^& "\" ^& %DisplayName% ^& ".lnk"^)
echo link.Description = %DisplayName%
echo link.TargetPath = %filename%
echo link.Arguments = %arguments%
echo link.WindowStyle = 1
echo link.IconLocation = %icon%
echo link.WorkingDirectory = %WorkingDir%
echo link.Save
)> "%temp%\makelink.vbs"
cscript //nologo "%temp%\makelink.vbs"
del "%temp%\makelink.vbs" 2>NUL
goto List
goto Proxy
:Proxy
@Echo off
:: Window Style
:: 1 = Normal, 3 Maximized, 7 = Minimized
:: Choose "Desktop" or "AllUsersDesktop"
set Location="Desktop"
set DisplayName="Proxies"
set filename="c:\Users\%USERNAME%\Desktop\Cmdtools\proxies.txt"
:: Set icon to an icon from an exe or "something.ico"
set icon="notepad.exe, 0"
set WorkingDir="C:\Users\%USERNAME%\Desktop"
set Arguments="xxx"
:: Make temporary VBS file to create shortcut
:: Then execute and delete it
(echo Dim DisplayName,Location,Path,shell,link
echo Set shell = CreateObject^("WScript.shell"^)
echo path = shell.SpecialFolders^(%Location%^)
echo Set link = shell.CreateShortcut^(path ^& "\" ^& %DisplayName% ^& ".lnk"^)
echo link.Description = %DisplayName%
echo link.TargetPath = %filename%
echo link.Arguments = %arguments%
echo link.WindowStyle = 1
echo link.IconLocation = %icon%
echo link.WorkingDirectory = %WorkingDir%
echo link.Save
)> "%temp%\makelink.vbs"
cscript //nologo "%temp%\makelink.vbs"
del "%temp%\makelink.vbs" 2>NUL
goto List
:List
@Echo off
:: Window Style
:: 1 = Normal, 3 Maximized, 7 = Minimized
:: Choose "Desktop" or "AllUsersDesktop"
set Location="Desktop"
set DisplayName="List"
set filename="c:\Users\%USERNAME%\Desktop\Cmdtools\list.txt"
:: Set icon to an icon from an exe or "something.ico"
set icon="notepad.exe, 0"
set WorkingDir="C:\Users\%USERNAME%\Desktop"
set Arguments="xxx"
:: Make temporary VBS file to create shortcut
:: Then execute and delete it
(echo Dim DisplayName,Location,Path,shell,link
echo Set shell = CreateObject^("WScript.shell"^)
echo path = shell.SpecialFolders^(%Location%^)
echo Set link = shell.CreateShortcut^(path ^& "\" ^& %DisplayName% ^& ".lnk"^)
echo link.Description = %DisplayName%
echo link.TargetPath = %filename%
echo link.Arguments = %arguments%
echo link.WindowStyle = 1
echo link.IconLocation = %icon%
echo link.WorkingDirectory = %WorkingDir%
echo link.Save
)> "%temp%\makelink.vbs"
cscript //nologo "%temp%\makelink.vbs"
del "%temp%\makelink.vbs" 2>NUL
::
if not exist C:\Users\%USERNAME%\Desktop\Proxies md C:\Users\%USERNAME%\Desktop\Proxies
if not exist c:\Users\%USERNAME%\Desktop\BlockRequests md c:\Users\%USERNAME%\Desktop\BlockRequests
if not exist C:\Users\%USERNAME%\Desktop\HashCheck md C:\Users\%USERNAME%\Desktop\HashCheck
::
Echo You should now have a shortcut on your desktop for list.txt and proxies.txt
Echo You should also have a shortcut to the batch file to run
Echo There should be 2 new folders on your desktop as well
pause
goto Start
:BlackholeSSH
@echo off
Title BlackHole a URL or an IP
color 17
cls
set /p user="Enter your Blackhole username: "
Echo Please type "yes" if you get the prompt about RSA keys
Echo Upon typing exit to terminate your session
Echo you will be taken back to the Main Screen
pause
ssh %user%@134.67.208.11
goto start
:BlackholePutty
@echo off
Title BlackHole a URL or an IP
color 17
cls
set /p user="Enter your Blackhole username: "
Echo Please type "yes" if you get the prompt about RSA keys
Echo Upon typing exit to terminate your session
Echo you will be taken back to the Main Screen
pause
putty.exe -ssh %user%@134.67.208.11
goto start
:DressSSH
@echo off
Title Dress for DNS Searches
color 17
cls
set /p user="Enter your Dress username: "
Echo Please type "yes" if you get the prompt about RSA keys
Echo Upon typing exit to terminate your session
Echo you will be taken back to the Main Screen
pause
putty.exe -ssh %user%@134.67.144.70
goto start
:DressPutty
@echo off
Title Dress for DNS Searches
color 17
cls
set /p user="Enter your Dress username: "
Echo Please type "yes" if you get the prompt about RSA keys
Echo Upon typing exit to terminate your session
Echo you will be taken back to the Main Screen
pause
putty.exe -ssh %user%@134.67.144.70
goto start
:HashMe
@echo off
cls
Title Check a file's MD5/SHA1 agains VirusTotal
color 17
set /p hashme="Enter full path to file or folder to be checked: "
echo Example: C:\tmp\ or C:\Windows\System32\cmd.exe 
echo Results will be put into Hashed folder on your Desktop
hashme.py %hashme% > Hashed.txt
pause
start hashed.txt
goto start
:ChangeLog
@echo off
cls
Title ChangeLog for your Viewing Pleasure
more ChangeLog.txt
pause
goto start
:end
exit