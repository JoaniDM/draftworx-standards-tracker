# Draftworx Standards Tracker — Build EXE Script
# Run this whenever you want to create a new EXE

Write-Host "Building Draftworx Standards Tracker EXE..." -ForegroundColor Cyan

# Copy latest index.html to app folder
Write-Host "Copying latest index.html..." -ForegroundColor Yellow
$sourceFile = Join-Path $PSScriptRoot 'index.html'
Copy-Item $sourceFile "C:\Tools\DraftworxApp\draftworx-standards-tracker\app\index.html" -Force

# Add Visual Studio Build Tools to PATH
$env:PATH += ";C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64"

# Navigate to build folder and build
Write-Host "Building EXE - this takes 2-5 minutes..." -ForegroundColor Yellow
Set-Location "C:\Tools\DraftworxApp\draftworx-standards-tracker"
tauri build --no-bundle

# Done
Write-Host "DONE! EXE is at:" -ForegroundColor Green
Write-Host "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\target\release\app.exe" -ForegroundColor Green
pause
