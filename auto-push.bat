@echo off
COLOR 0A
title CATRACHO HUB - Auto GitHub Updater
echo.
echo ========================================
echo    CATRACHO HUB - Auto Updater
echo ========================================
echo.
echo This will automatically push changes to GitHub
echo whenever you save files!
echo.
echo Press Ctrl+C to stop watching
echo.
echo ----------------------------------------
echo.

cd /d "%~dp0"

:watch_loop
    echo [%TIME%] Checking for changes...
    git status --porcelain > temp_status.txt
    set /p CHANGES=<temp_status.txt
    del temp_status.txt

    if not "%CHANGES%"=="" (
        echo [%TIME%] Changes detected! Pushing to GitHub...
        echo.

        git add .
        if errorlevel 1 (
            echo ERROR: Failed to add files!
            goto watch_loop
        )

        git commit -m "Auto-update: %DATE% %TIME%"
        if errorlevel 1 (
            echo No changes to commit
            goto watch_loop
        )

        git push
        if errorlevel 1 (
            echo ERROR: Push failed!
            goto watch_loop
        )

        echo.
        echo ========================================
        echo    SUCCESS! Website updated!
        echo ========================================
        echo.
        echo Your changes are live at:
        echo https://mrwhoshack.github.io/catracho-hub/
        echo.
        echo [%TIME%] Ready to watch for more changes...
        echo.
    )

    timeout /t 5 /nobreak > nul
goto watch_loop