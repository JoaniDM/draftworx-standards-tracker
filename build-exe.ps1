Write-Host 'Building EXE - this takes 2-5 minutes...' -ForegroundColor Yellow
$env:PATH += ';C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64'
$SourceRoot = "C:\Users\JoaniD’Emiljo\OneDrive - Data Prime Solutions (Pty) Ltd\9.APPS\draftworx-standards-tracker"
Write-Host 'Copying latest files...' -ForegroundColor Cyan
Copy-Item "$SourceRoot\index.html" "C:\Tools\DraftworxApp\draftworx-standards-tracker\app\index.html" -Force
Copy-Item "$SourceRoot\src-tauri\Cargo.toml" "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\Cargo.toml" -Force
Copy-Item "$SourceRoot\src-tauri\tauri.conf.json" "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\tauri.conf.json" -Force
Copy-Item "$SourceRoot\src-tauri\capabilities\default.json" "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\capabilities\default.json" -Force
Copy-Item "$SourceRoot\src-tauri\src\lib.rs" "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\src\lib.rs" -Force
Copy-Item "$SourceRoot\src-tauri\icons" "C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\icons" -Recurse -Force
Remove-Item 'C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\target\release\draftworx-standards-tracker.exe' -Force -ErrorAction SilentlyContinue
Set-Location 'C:\Tools\DraftworxApp\draftworx-standards-tracker'
tauri build --no-bundle
try { Copy-Item 'C:\Tools\DraftworxApp\draftworx-standards-tracker\src-tauri\target\release\draftworx-standards-tracker.exe' "$SourceRoot\draftworx-standards-tracker.exe" -Force; Write-Host 'EXE copied!' -ForegroundColor Green } catch { Write-Host 'Copy failed:' $_ -ForegroundColor Red }
pause
