$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove the specflow executable
$exePath = Join-Path $toolsDir "specflow.exe"
if (Test-Path $exePath) {
    Remove-Item $exePath -Force -ErrorAction SilentlyContinue
    Write-Host "SpecFlow has been uninstalled."
} else {
    Write-Warning "SpecFlow executable not found at: $exePath"
}
