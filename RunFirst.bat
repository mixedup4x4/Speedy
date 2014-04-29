::Copy entire directory to c:Users\%username%\Desktop\CmdTools
@echo off
if not exist C:\Users\%USERNAME%\Desktop\CmdTools md C:\Users\%USERNAME%\Desktop\CmdTools
copy *.* C:\Users\%USERNAME%\Desktop\CmdTools
Echo Open your new Folder CmdTools and drag a shortcut of RunMe.bat to your desktop
Echo Upon running the RunMe.bat for the first time, select the Setup Option (number may change)
Echo Enjoy your new User Interface for our tools
Pause
@echo off
Exit
