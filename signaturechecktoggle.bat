@echo off
setlocal
title Driver Signature Enforcmant Toggle

echo Options
echo 1: Enable Driver Signature Enforcmant Toggle
echo 2: Disable Driver Signature Enforcmant Toggle
SET /P pick=Pick your option: 
goto %pick%



:1
bcdedit.exe /set nointegritychecks off REM enable it
echo press any key to close
pause >nul
exit
echo If I don't close, please close me
pause

:2
bcdedit.exe /set nointegritychecks on REM disable it
endlocal
echo press any key to close
pause >nul
exit
echo If I don't close, please close me
pause