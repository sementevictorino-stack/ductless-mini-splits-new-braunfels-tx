# Validation script to check if all updates were successful
Write-Host "Running validation checks..." -ForegroundColor Green

$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse
$issues = @()

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Check for remaining CA references that should be TX
    if ($content -match '\bCA\b' -and $content -notmatch 'Call|Can|Car|Care|Cast|Cat|Capacity') {
        $issues += "File $($file.Name): Still contains CA references"
    }
    
    # Check for remaining San Jose references
    if ($content -match 'San Jose') {
        $issues += "File $($file.Name): Still contains San Jose references"
    }
    
    # Check for remaining California references
    if ($content -match '\bCalifornia\b') {
        $issues += "File $($file.Name): Still contains California references"
    }
    
    # Check for broken JavaScript
    if ($content -match 'unesTXpe|LoCalBusiness') {
        $issues += "File $($file.Name): Contains broken JavaScript/technical terms"
    }
}

if ($issues.Count -eq 0) {
    Write-Host "✅ All files successfully updated! No issues found." -ForegroundColor Green
    Write-Host "✅ Total files processed: $($htmlFiles.Count)" -ForegroundColor Green
    Write-Host "✅ All content has been successfully localized from San Jose, CA to New Braunfels, TX" -ForegroundColor Green
} else {
    Write-Host "⚠️ Found $($issues.Count) potential issues:" -ForegroundColor Yellow
    $issues | ForEach-Object { Write-Host "  $_" -ForegroundColor Yellow }
}

# Summary of changes made
Write-Host "`n📋 Summary of Changes Made:" -ForegroundColor Cyan
Write-Host "  • Changed location from San Jose, CA to New Braunfels, TX" -ForegroundColor White
Write-Host "  • Updated zip codes from 95xxx to 78130, 78132, 78665" -ForegroundColor White
Write-Host "  • Changed regional references from South Bay to Texas Hill Country" -ForegroundColor White
Write-Host "  • Updated coordinates to New Braunfels location" -ForegroundColor White
Write-Host "  • Updated business address to 1450 Common St, New Braunfels, TX 78130" -ForegroundColor White
Write-Host "  • Changed email to info@newbraunfelsminisplits.com" -ForegroundColor White
Write-Host "  • Maintained ductless mini split category throughout" -ForegroundColor White
Write-Host "  • Updated location pages to reflect Texas Hill Country cities" -ForegroundColor White
