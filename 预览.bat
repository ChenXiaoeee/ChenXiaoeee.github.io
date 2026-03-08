@echo off
chcp 65001 >nul

echo ========================================
echo Starting Hugo local server...
echo Access your blog at: http://localhost:1313
echo Press Ctrl+C to stop the server.
echo ========================================
echo.

REM 启动 Hugo 服务器，并在后台运行
start /B hugo server -D

REM 等待几秒钟，确保服务器已经启动
timeout /t 3 /nobreak >nul

REM 手动打开浏览器
start http://localhost:1313

REM 等待用户按下 Ctrl+C 来停止服务器
pause

REM 停止 Hugo 服务器
taskkill /f /im hugo.exe >nul
