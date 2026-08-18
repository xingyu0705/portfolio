@echo off
echo ============================================
echo    Update Portfolio to GitHub Pages
echo ============================================
echo.

set /p MSG="Enter update message (default: update): "
if "%MSG%"=="" set MSG=update portfolio

echo.
echo Adding changes...
git add .

echo Committing...
git commit -m "%MSG%"

echo Pushing...
git push

if %ERRORLEVEL% EQU 0 (
  echo.
  echo ============================================
  echo    UPDATE SUCCESS!
  echo ============================================
  echo Refresh your page in 1-2 minutes.
) else (
  echo.
  echo Update failed. Please run deploy.bat first.
)

echo.
pause
