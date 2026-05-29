@echo off
chcp 65001 >nul
title Manga Web Translator - Launcher
echo ====================================================================
echo   Manga Web Translator Chrome Extension Launcher
echo ====================================================================
echo.
echo กำลังค้นหา Google Chrome ในระบบ...

set "CHROME_PATH="

if exist "%ProgramFiles%GoogleChromeApplicationchrome.exe" (
    set "CHROME_PATH=%ProgramFiles%GoogleChromeApplicationchrome.exe"
) else if exist "%ProgramFiles(x86)%GoogleChromeApplicationchrome.exe" (
    set "CHROME_PATH=%ProgramFiles(x86)%GoogleChromeApplicationchrome.exe"
) else if exist "%LocalAppData%GoogleChromeApplicationchrome.exe" (
    set "CHROME_PATH=%LocalAppData%GoogleChromeApplicationchrome.exe"
)

if "%CHROME_PATH%"=="" (
    echo [ERROR] ไม่พบ Google Chrome ในเครื่องของคุณในตำแหน่งมาตรฐาน
    echo กรุณาเปิด Google Chrome ด้วยตัวเอง และไปที่ chrome://extensions เพื่อติดตั้งแบบ Unpacked
    echo.
    pause
    exit /b 1
)

echo พบ Google Chrome: "%CHROME_PATH%"
echo กำลังโหลด Extension จากโฟลเดอร์: "%~dp0"
echo.
echo กำลังเปิด Google Chrome พร้อมโหลด Extension ให้อัตโนมัติ...
echo.

start "" "%CHROME_PATH%" --load-extension="%~dp0." "http://localhost:3000" "https://tapas.io"

echo [สำเร็จ] เปิดใช้งาน Google Chrome เรียบร้อยแล้ว!
echo คุณสามารถใช้งานส่วนขยายได้ทันที (คลิกที่ไอคอนจิ๊กซอว์ / ส่วนขยาย บนแถบเครื่องมือของ Chrome)
echo.
pause
