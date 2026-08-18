@echo off
chcp 65001 >nul
echo ============================================
echo    更新作品集到 GitHub Pages
echo ============================================
echo.

set /p MSG="请输入更新说明(默认: 更新作品集内容): "
if "%MSG%"=="" set MSG=更新作品集内容

echo.
echo 正在添加更改...
git add .

echo 正在提交...
git commit -m "%MSG%"

echo 正在推送...
git push

if %ERRORLEVEL% EQU 0 (
  echo.
  echo ============================================
  echo    更新成功！1-2分钟后刷新网页即可看到
  echo ============================================
) else (
  echo.
  echo 更新失败，请检查网络连接或运行 deploy.bat
)

echo.
pause
