@echo off
echo ============================================
echo    Deploy Portfolio to GitHub Pages
echo ============================================
echo.

set /p USERNAME="Enter your GitHub username: "
set /p REPO="Enter repo name (default: portfolio): "

if "%REPO%"=="" set REPO=portfolio

echo.
echo Adding remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/%USERNAME%/%REPO%.git

echo Renaming branch to main...
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
  echo.
  echo ============================================
  echo    SUCCESS!
  echo ============================================
  echo.
  echo Next steps:
  echo 1. Open https://github.com/%USERNAME%/%REPO%/settings/pages
  echo 2. Source: Deploy from a branch
  echo 3. Branch: main / root
  echo 4. Click Save
  echo.
  echo Your site will be live at:
  echo https://%USERNAME%.github.io/%REPO%/
  echo.
) else (
  echo.
  echo Push failed. Please check:
  echo 1. Did you create the repo "%REPO%" on GitHub?
  echo 2. Is your username "%USERNAME%" correct?
  echo 3. Is your internet working?
  echo.
)

pause
