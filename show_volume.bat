@echo off

@echo off
:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%cd%"
    CD /D "%~dp0"


title Show Hidden Volume

:menu
cls

echo =========================
echo      LIST OF VOLUMES
echo =========================
echo.

echo list volume > "%temp%\list.txt"
diskpart /s "%temp%\list.txt"

echo.
set /p VOL=Enter volume number to SHOW: 

echo.
set /p LETTER=Enter drive letter to assign (example: Z): 

(
echo select volume %VOL%
echo assign letter=%LETTER%
) > "%temp%\show.txt"

echo.
echo Showing volume...
diskpart /s "%temp%\show.txt"

del "%temp%\list.txt"
del "%temp%\show.txt"

echo.
echo Done.
pause