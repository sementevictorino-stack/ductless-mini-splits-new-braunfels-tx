# Final comprehensive script to update location files with proper Texas Hill Country cities
Write-Host "Starting location-specific updates for Texas Hill Country..." -ForegroundColor Green

# Define the mapping of California cities to Texas Hill Country cities
$cityMappings = @{
    "Campbell" = "San Marcos"
    "Cupertino" = "Kyle"
    "Dublin" = "Seguin"
    "Foster-City" = "Canyon Lake"
    "Fremont" = "Gruene"
    "Hayward" = "Wimberley"
    "Livermore" = "Bulverde"
    "Los-Altos" = "Spring Branch"
    "Los-Gatos" = "Schertz"
    "Menlo-Park" = "San Antonio"
    "Milpitas" = "Dripping Springs"
    "Mountain-View" = "Buda"
    "Newark" = "Lockhart"
    "Palo-Alto" = "Cedar Park"
    "Pleasanton" = "Round Rock"
    "Redwood-City" = "Georgetown"
    "San-Mateo" = "Leander"
    "Santa-Clara" = "Austin"
    "Sunnyvale" = "Pflugerville"
    "Union-City" = "Marble Falls"
}

# Process each location file
foreach ($mapping in $cityMappings.GetEnumerator()) {
    $caCity = $mapping.Key
    $txCity = $mapping.Value
    
    $fileName = "$caCity.html"
    $filePath = Join-Path "locations" $fileName
    
    if (Test-Path $filePath) {
        Write-Host "Updating $fileName to $txCity..." -ForegroundColor Yellow
        
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # Replace the city name in title and meta tags
        $caDisplayName = $caCity.Replace("-", " ")
        $txDisplayName = $txCity.Replace("-", " ")
        
        $content = $content -replace [regex]::Escape($caDisplayName), $txDisplayName
        $content = $content -replace [regex]::Escape($caCity), $txCity
        
        # Update specific references
        $content = $content -replace "Campbell TX", "$txDisplayName TX"
        $content = $content -replace "Cupertino TX", "$txDisplayName TX"
        $content = $content -replace "Dublin TX", "$txDisplayName TX"
        $content = $content -replace "Foster City TX", "$txDisplayName TX"
        $content = $content -replace "Fremont TX", "$txDisplayName TX"
        $content = $content -replace "Hayward TX", "$txDisplayName TX"
        $content = $content -replace "Livermore TX", "$txDisplayName TX"
        $content = $content -replace "Los Altos TX", "$txDisplayName TX"
        $content = $content -replace "Los Gatos TX", "$txDisplayName TX"
        $content = $content -replace "Menlo Park TX", "$txDisplayName TX"
        $content = $content -replace "Milpitas TX", "$txDisplayName TX"
        $content = $content -replace "Mountain View TX", "$txDisplayName TX"
        $content = $content -replace "Newark TX", "$txDisplayName TX"
        $content = $content -replace "Palo Alto TX", "$txDisplayName TX"
        $content = $content -replace "Pleasanton TX", "$txDisplayName TX"
        $content = $content -replace "Redwood City TX", "$txDisplayName TX"
        $content = $content -replace "San Mateo TX", "$txDisplayName TX"
        $content = $content -replace "Santa Clara TX", "$txDisplayName TX"
        $content = $content -replace "Sunnyvale TX", "$txDisplayName TX"
        $content = $content -replace "Union City TX", "$txDisplayName TX"
        
        # Save the updated content
        $content | Out-File -FilePath $filePath -Encoding UTF8 -NoNewline
    }
}

Write-Host "Location-specific updates completed!" -ForegroundColor Green
