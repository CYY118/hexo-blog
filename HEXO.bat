@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:menu
cls
echo *********************************************
echo *           Hexo Blog Management            *
echo *********************************************
echo * 1. 创建新文章                             *
echo * 2. 创建新页面                             *
echo * 3. 生成静态文件                           *
echo * 4. 创建文章并自动打开Typora编辑器         *
echo * 5. 本地运行网站并自动打开浏览器           *
echo * 6. 清除缓存                               *
echo * 7. 一键部署                               *
echo * 8. 退出                                   *
echo *********************************************
set /p choice=请输入您的选择（1-8）：

if %choice%==1 goto article
if %choice%==2 goto page
if %choice%==3 goto generate
if %choice%==4 goto article_with_editor
if %choice%==5 goto server
if %choice%==6 goto clean
if %choice%==7 goto deploy
if %choice%==8 goto exit

:article
set /p name=请输入文章名字：
call hexo new "%name%"
echo 文章创建成功，请按任意键返回菜单。
pause >nul
goto menu

:page
set /p pagename=请输入页面名字：
call hexo new page "%pagename%"
echo 页面创建成功，请按任意键返回菜单。
pause >nul
goto menu

:generate
call hexo generate
echo 静态文件生成成功，请按任意键返回菜单。
pause >nul
goto menu

:article_with_editor
set /p name=请输入文章名字：
call hexo new "%name%"
echo 文章创建成功，正在打开Typora编辑器...
start "" "typora" "source\_posts\%name%.md"
echo 请在Typora中编辑文章，编辑完成后按任意键返回菜单。
pause >nul
goto menu

:server
start cmd /k "hexo server"
echo 本地服务器已启动，请访问 http://localhost:4000/，浏览器将在服务器启动后5秒内自动打开。
timeout /t 5 >nul
echo 浏览器已自动打开本地Hexo页面。
start "" "http://localhost:4000"
pause >nul
goto menu

:clean
call hexo clean
echo 缓存已清除，请按任意键返回菜单。
pause >nul
goto menu

:deploy
call hexo clean && call hexo g && call hexo d && call hexo cl
echo 部署完成，请按任意键返回菜单。
pause >nul
goto menu

:exit
echo 感谢使用，再见！
exit