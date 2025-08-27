# PowerShell script to fix remaining issues in HTML files
Write-Host "Starting final fixes..." -ForegroundColor Green

# Get all HTML files in the project
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse

$totalFiles = $htmlFiles.Count
$processedFiles = 0

foreach ($file in $htmlFiles) {
    $processedFiles++
    Write-Host "Processing file $processedFiles of $totalFiles`: $($file.Name)" -ForegroundColor Yellow
    
    # Read the file content
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Fix common broken words from overly broad replacements
    $content = $content -replace "sCale", "scale"
    $content = $content -replace "loTXtion", "location"
    $content = $content -replace "appliTXtion", "application"
    $content = $content -replace "loTX", "loca"
    $content = $content -replace "eduTXtion", "education"
    $content = $content -replace "vaTXtion", "vacation"
    $content = $content -replace "TXll", "Call"
    $content = $content -replace "TXn", "Can"
    $content = $content -replace "TXr", "Car"
    $content = $content -replace "TXse", "Case"
    $content = $content -replace "TXsh", "Cash"
    $content = $content -replace "TXpt", "Capt"
    $content = $content -replace "TXmp", "Camp"
    $content = $content -replace "TXrd", "Card"
    $content = $content -replace "TXre", "Care"
    $content = $content -replace "TXst", "Cast"
    $content = $content -replace "TXt", "Cat"
    
    # Now fix any location-specific content that should reference Texas Hill Country cities
    # Update the dropdown/navigation content to reflect Texas locations instead of California ones
    if ($file.Name -eq "index.html") {
        # Update the navigation locations to reflect Texas Hill Country cities
        $content = $content -replace 'locations/santa-clara\.html">Santa Clara', 'locations/san-marcos.html">San Marcos'
        $content = $content -replace 'locations/sunnyvale\.html">Sunnyvale', 'locations/kyle.html">Kyle'
        $content = $content -replace 'locations/milpitas\.html">Milpitas', 'locations/seguin.html">Seguin'
        $content = $content -replace 'locations/campbell\.html">Campbell', 'locations/canyon-lake.html">Canyon Lake'
        $content = $content -replace 'locations/cupertino\.html">Cupertino', 'locations/gruene.html">Gruene'
        $content = $content -replace 'locations/fremont\.html">Fremont', 'locations/wimberley.html">Wimberley'
        $content = $content -replace 'locations/mountain-view\.html">Mountain View', 'locations/bulverde.html">Bulverde'
        $content = $content -replace 'locations/palo-alto\.html">Palo Alto', 'locations/spring-branch.html">Spring Branch'
        $content = $content -replace 'locations/union-city\.html">Union City', 'locations/schertz.html">Schertz'
        $content = $content -replace 'locations/hayward\.html">Hayward', 'locations/san-antonio.html">San Antonio'
    }
    
    # Save the updated content back to the file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8 -NoNewline
}

Write-Host "Final fixes completed! Processed $totalFiles files." -ForegroundColor Green
