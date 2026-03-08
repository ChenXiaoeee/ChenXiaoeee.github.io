@echo off
chcp 65001 >nul
cls

echo ==============================================
echo           Hugo 博客新建文章（带内容）
echo ==============================================
echo.

echo 【1/3】拉取 GitHub 最新代码...
git pull
echo.

echo 【2/3】请输入文章文件名（英文，不用加.md）
set /p filename=文件名：
echo.

echo 正在创建文章...
hugo new posts/%filename%.md

:: ==============================================
:: 下面是自动写入文章内容（标题、日期、模板）
:: ==============================================
echo 写入文章内容模板...
(
echo ---
echo title: "%filename%"
echo date: %date:~0,4%-%date:~5,2%-%date:~8,2%T12:00:00+08:00
echo draft: false
echo categories: ["笔记"]
echo tags: ["学习", "随笔"]
echo ---
echo.
echo # 文章正文
echo.
echo 这里开始写内容…
echo.
) > "content\posts\%filename%.md"

echo.
echo 【3/3】正在打开文章…
start notepad.exe "content\posts\%filename%.md"

echo.
echo ✅ 新建文章完成！
echo.
pause