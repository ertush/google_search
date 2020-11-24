# If the module is already in memory, remove it
Get-Module google_search | Remove-Module -Force

# Import module
import-module -Name pester -Force

$testFiles = @("search-bing.Tests.ps1",
            "search-youtube.Tests.ps1",
            "search-google.Tests.ps1",
            "search-duckduckgo.Tests.ps1",
            "open-site.Tests.ps1")

foreach ($file in $testFiles){
    # Testing All files with pester
    Invoke-Pester $(Join-Path ".\test" $file) -Output Detailed
    Start-Sleep 1
}