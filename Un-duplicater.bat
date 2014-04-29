@echo off > outfile
Color 04
if %1'==' echo which file? && goto :eof
if not exist %1 echo %1 not found && goto :eof
for /f "tokens=* delims= " %%a in (%1) do (
find "%%a" < outfile > nul
if errorlevel 1 echo %%a >> outfile
)
del Working.txt
rename outfile Working.txt
del outfile.com
copy Working.txt c:\users\%username%\Desktop\WorkingProxies.txt
exit