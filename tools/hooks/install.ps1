# PowerShell Script zum Installieren des Pre-commit Hooks auf Windows
Copy-Item "tools/hooks/pre-commit" ".git/hooks/pre-commit" -Force
Write-Host "Pre-commit Hook installiert." -ForegroundColor Green
Write-Host "Der Validator wird jetzt vor jedem Commit automatisch ausgefuehrt." -ForegroundColor Yellow
