Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   Deploy Portfolio to GitHub Pages" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$USERNAME = Read-Host "Enter your GitHub username"
$REPO = Read-Host "Enter repo name (default: portfolio)"
if ([string]::IsNullOrWhiteSpace($REPO)) { $REPO = "portfolio" }

Write-Host ""
Write-Host "Adding remote repository..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin "https://github.com/$USERNAME/$REPO.git"

Write-Host "Renaming branch to main..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "   SUCCESS!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor White
    Write-Host "1. Open: https://github.com/$USERNAME/$REPO/settings/pages"
    Write-Host "2. Source: Deploy from a branch"
    Write-Host "3. Branch: main / (root)"
    Write-Host "4. Click Save"
    Write-Host ""
    Write-Host "Your site will be live at:" -ForegroundColor Cyan
    Write-Host "https://$USERNAME.github.io/$REPO/" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Push failed. Please check:" -ForegroundColor Red
    Write-Host "1. Did you create the repo '$REPO' on GitHub?"
    Write-Host "2. Is your username '$USERNAME' correct?"
    Write-Host "3. Is your internet working?"
    Write-Host ""
}

Read-Host "Press Enter to exit"
