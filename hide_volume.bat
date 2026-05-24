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


title Volume Hider

:: Create temporary diskpart script for listing volumes
echo list volume > "%temp%\list.txt"

:: Show volumes and KEEP CMD OPEN
diskpart /s "%temp%\list.txt"

echo.
set /p VOL=Enter the volume number to hide: 

:: Create diskpart script for removing drive letter
(
echo select volume %VOL%
echo remove
) > "%temp%\hide.txt"

:: Execute hide operation
diskpart /s "%temp%\hide.txt"

:: Cleanup
del "%temp%\list.txt"
del "%temp%\hide.txt"

echo.
echo Done.
pause