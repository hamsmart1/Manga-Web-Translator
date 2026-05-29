$chromePath = ""
if (Test-Path "$env:ProgramFiles\Google\Chrome\Application\chrome.exe") {
    $chromePath = "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
} elseif (Test-Path "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe") {
    $chromePath = "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
} elseif (Test-Path "$env:LocalAppData\Google\Chrome\Application\chrome.exe") {
    $chromePath = "$env:LocalAppData\Google\Chrome\Application\chrome.exe"
}

if ($chromePath -eq "") {
    Write-Host "[ERROR] Google Chrome was not found." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

$extPath = $PSScriptRoot
$tempProfile = Join-Path $env:TEMP "manga-translator-chrome-profile"

Write-Host "Launching Google Chrome with extension loaded..."
Start-Process -FilePath $chromePath -ArgumentList "--load-extension=`"$extPath`"", "--user-data-dir=`"$tempProfile`""