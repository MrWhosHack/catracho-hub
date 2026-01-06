@echo off
COLOR 0A
title CATRACHO HUB - Push to GitHub
echo.
echo ========================================
echo    CATRACHO HUB - GitHub Updater
echo ========================================
echo.
echo This will push your changes to GitHub
echo and update your live website!
echo.
echo ----------------------------------------
echo.

set /p message="Enter a description of your changes: "

if "%message%"=="" set message=Updated website

echo.
echo Processing...
echo.

cd /d "%~dp0"

git add .
if errorlevel 1 (
    echo ERROR: Failed to add files!
    pause
    exit /b 1
)

git commit -m "%message%"
if errorlevel 1 (
    echo No changes to commit or commit failed
    pause
    exit /b 1
)

git push
if errorlevel 1 (
    echo ERROR: Push failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo    SUCCESS! Your website is updating
echo ========================================
echo.
echo Your changes are being deployed to:
echo https://mrwhoshack.github.io/catracho-hub/
echo.
echo Wait 30-60 seconds, then refresh the page!
echo.
pause
