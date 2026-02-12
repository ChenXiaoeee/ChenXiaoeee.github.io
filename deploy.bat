@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo Generating static files...
hugo
if %errorlevel% neq 0 (
    echo ERROR: Failed to generate static files!
    pause
    exit /b 1
)

echo.
echo Adding changes to Git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: git add failed!
    pause
    exit /b 1
)

echo.
echo Committing changes...
git commit -m "Auto deploy: %date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,8%"
if %errorlevel% neq 0 (
    echo ERROR: git commit failed!
    pause
    exit /b 1
)

echo.
echo Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ERROR: git push failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Deployment succeeded! 🎉
echo Your blog has been updated to GitHub Pages.
pause