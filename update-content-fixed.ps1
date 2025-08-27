# PowerShell script to carefully update all HTML files from San Jose, CA to New Braunfels, TX
# Category: Ductless Mini Split
# City: New Braunfels
# State: TX

Write-Host "Starting refined content update from San Jose, CA to New Braunfels, TX..." -ForegroundColor Green

# Get all HTML files in the project
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse

$totalFiles = $htmlFiles.Count
$processedFiles = 0

foreach ($file in $htmlFiles) {
    $processedFiles++
    Write-Host "Processing file $processedFiles of $totalFiles`: $($file.Name)" -ForegroundColor Yellow
    
    # Read the file content
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Fix the broken replacements first (restore CA to CA where it was incorrectly replaced)
    $content = $content -replace "TXmpbell", "Campbell"
    $content = $content -replace "TXlifornia", "California"
    $content = $content -replace "TXl", "Cal"
    
    # Now do the correct location replacements
    $content = $content -replace "\bSan Jose\b", "New Braunfels"
    $content = $content -replace "\bCA\b", "TX"
    $content = $content -replace "\bCalifornia\b", "Texas"
    
    # Specific geo/zip code replacements
    $content = $content -replace "95110|95111|95112|95113|95116|95117|95118|95119|95120|95121|95122|95123|95124|95125|95126|95127|95128|95129|95130|95131|95132|95133|95134|95135|95136|95138|95139|95140|95141|95148|95150|95151|95152|95153|95154|95155|95156|95157|95158|95159|95160|95161|95164|95170|95172|95173|95190|95191|95192|95193|95194|95196", "78130, 78132, 78665"
    
    # Address replacements
    $content = $content -replace "1500 Technology Dr", "1450 Common St"
    $content = $content -replace "95110", "78130"
    
    # Coordinates replacements (San Jose to New Braunfels)
    $content = $content -replace "37\.3382", "29.7030"
    $content = $content -replace "-121\.8863", "-98.1245"
    $content = $content -replace "37\.2871", "29.7030"
    $content = $content -replace "-121\.9499", "-98.1245"
    
    # Regional references
    $content = $content -replace "South Bay", "Texas Hill Country"
    $content = $content -replace "Santa Clara County", "Comal County"
    $content = $content -replace "Mediterranean climate", "hot Texas climate"
    $content = $content -replace "tech campus|tech corridor", "residential developments"
    $content = $content -replace "Victorian homes", "German heritage homes"
    
    # Email addresses
    $content = $content -replace "info@sanjoseminisplits\.com", "info@newbraunfelsminisplits.com"
    
    # Business name replacements
    $content = $content -replace "New Braunfels Ductless Mini Splits", "New Braunfels Ductless Mini Splits"
    $content = $content -replace "New Braunfels Mini Splits", "New Braunfels Mini Splits"
    
    # Save the updated content back to the file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8 -NoNewline
}

Write-Host "Refined content update completed! Processed $totalFiles files." -ForegroundColor Green
Write-Host "All HTML files have been updated from San Jose, CA to New Braunfels, TX" -ForegroundColor Green
