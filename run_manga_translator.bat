@echo off
title Manga Web Translator - Launcher
echo ====================================================================
echo   Manga Web Translator Chrome Extension Launcher
echo ====================================================================
echo.
echo Searching for Google Chrome...

set "CHROME_PATH="

if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    set "CHROME_PATH=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
) else if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    set "CHROME_PATH=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
) else if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
    set "CHROME_PATH=%LocalAppData%\Google\Chrome\Application\chrome.exe"
)

if "%CHROME_PATH%"=="" (
    echo [ERROR] Google Chrome was not found in standard locations.
    echo Please open Google Chrome manually and go to chrome://extensions to load the extension.
    echo.
    pause
    exit /b 1
)

echo Found Chrome: "%CHROME_PATH%"
echo Loading extension from: "%~dp0"
echo.
echo Launching Google Chrome with the extension loaded...
echo.

start "" "%CHROME_PATH%" --load-extension="%~dp0." "http://localhost:3000" "https://tapas.io"

echo [SUCCESS] Google Chrome launched successfully!
echo You can find the extension in the extensions menu (puzzle icon).
echo.
pause