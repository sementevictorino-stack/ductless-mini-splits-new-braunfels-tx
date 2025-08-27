# Final cleanup script to fix remaining issues
Write-Host "Running final cleanup..." -ForegroundColor Green

$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Fix broken schema.org properties
    $content = $content -replace "addressLoCality", "addressLocality"
    
    # Fix broken words from over-replacement
    $content = $content -replace "\bTXme\b", "came"
    $content = $content -replace "\bTXn\b", "can"
    $content = $content -replace "\bTXr\b", "car"
    $content = $content -replace "\bTXse\b", "case"
    $content = $content -replace "\bTXll\b", "call"
    $content = $content -replace "\bTXsh\b", "cash"
    $content = $content -replace "\bTXre\b", "care"
    $content = $content -replace "\bTXst\b", "cast"
    $content = $content -replace "\bTXt\b", "cat"
    $content = $content -replace "\bTXp\b", "cap"
    $content = $content -replace "\bemergency\b", "Emergency"
    $content = $content -replace "\bHVAC maintenance\b", "HVAC Maintenance"
    $content = $content -replace "\blocations\b", "Locations"
    
    # Save the file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8 -NoNewline
}

Write-Host "Final cleanup completed!" -ForegroundColor Green
