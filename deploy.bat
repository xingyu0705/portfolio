@echo off
chcp 65001 >nul
echo ============================================
echo    作品集一键部署到 GitHub Pages
echo ============================================
echo.

set /p USERNAME="请输入您的GitHub用户名: "
set /p REPO="请输入仓库名称(默认: portfolio): "

if "%REPO%"=="" set REPO=portfolio

echo.
echo 正在添加远程仓库...
git remote remove origin 2>nul
git remote add origin https://github.com/%USERNAME%/%REPO%.git

echo 正在重命名分支为 main...
git branch -M main

echo.
echo 正在推送到 GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
  echo.
  echo ============================================
  echo    推送成功！
  echo ============================================
  echo.
  echo 接下来请在浏览器中操作：
  echo 1. 打开 https://github.com/%USERNAME%/%REPO%/settings/pages
  echo 2. 在 "Build and deployment" 下
  echo 3. Source 选择 "Deploy from a branch"
  echo 4. Branch 选择 "main" 和 "/ (root)"
  echo 5. 点击 Save
  echo.
  echo 等待1-2分钟后，您的作品集将上线：
  echo https://%USERNAME%.github.io/%REPO%/
  echo.
) else (
  echo.
  echo 推送失败，请检查：
  echo 1. 是否已在GitHub创建仓库 %REPO%
  echo 2. 用户名 %USERNAME% 是否正确
  echo 3. 网络连接是否正常
  echo.
)

pause
