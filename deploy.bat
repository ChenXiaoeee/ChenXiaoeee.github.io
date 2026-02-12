@echo off
echo ========================================
echo 正在生成静态文件...
hugo
if %errorlevel% neq 0 (
    echo 错误：生成静态文件失败！
    pause
    exit /b 1
)

echo.
echo 正在添加更改到 Git...
git add .
if %errorlevel% neq 0 (
    echo 错误：git add 失败！
    pause
    exit /b 1
)

echo.
echo 正在提交更改...
git commit -m "自动部署：%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,8%"
if %errorlevel% neq 0 (
    echo 错误：git commit 失败！
    pause
    exit /b 1
)

echo.
echo 正在推送到 GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo 错误：git push 失败！
    pause
    exit /b 1
)

echo.
echo ========================================
echo 部署成功！🎉
echo 你的博客已更新到 GitHub Pages。
pause