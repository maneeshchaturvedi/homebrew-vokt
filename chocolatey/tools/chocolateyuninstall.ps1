$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove the vokt executable
$exePath = Join-Path $toolsDir "vokt.exe"
if (Test-Path $exePath) {
    Remove-Item $exePath -Force -ErrorAction SilentlyContinue
    Write-Host "Vokt binary removed."
} else {
    Write-Warning "Vokt executable not found at: $exePath"
}

# Remove bundled Go toolchain
$goDir = Join-Path $toolsDir "go"
if (Test-Path $goDir) {
    Remove-Item $goDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Bundled Go toolchain removed."
}

# Remove Java engine JARs
foreach ($jar in @("vokt-java-engine.jar", "tai-e-all.jar")) {
    $jarPath = Join-Path $toolsDir $jar
    if (Test-Path $jarPath) {
        Remove-Item $jarPath -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Vokt has been uninstalled."
