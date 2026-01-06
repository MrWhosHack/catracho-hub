@echo off
COLOR 0A
title CATRACHO HUB - Quick Push
echo.
echo ========================================
echo    CATRACHO HUB - Quick Push
echo ========================================
echo.
echo Pushing your changes to GitHub...
echo.

cd /d "%~dp0"

git add .
if errorlevel 1 (
    echo ERROR: Failed to add files!
    pause
    exit /b 1
)

git commit -m "Quick update: %DATE% %TIME%"
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
echo    SUCCESS! Website updated!
echo ========================================
echo.
echo Your changes are live at:
echo https://mrwhoshack.github.io/catracho-hub/
echo.
echo Wait 30-60 seconds, then refresh your browser!
echo.
pause