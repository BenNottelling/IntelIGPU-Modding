@echo off
setlocal
title Driver Signature Enforcmant Toggle

:PROMPT
SET /P AREYOUSURE=Would you like to enable or disable Driver Signature Enforcmant Toggle? (E/[D])?
IF /I "%AREYOUSURE%" NEQ "E" GOTO enable
bcdedit.exe /set nointegritychecks on REM disable it


:enable
bcdedit.exe /set nointegritychecks off REM enable it
endlocal
