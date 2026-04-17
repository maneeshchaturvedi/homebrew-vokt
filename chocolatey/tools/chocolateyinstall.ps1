$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = '$DOWNLOAD_URL$'
$jarUrl = '$JAR_URL$'
$taieUrl = '$TAIE_URL$'
$goUrl = '$GO_URL$'
$checksum64 = '$CHECKSUM$'
$goChecksum = '$GO_CHECKSUM$'

$packageArgs = @{
  packageName   = 'vokt-cli'
  fileType      = 'exe'
  url64bit      = $url64
  softwareName  = 'vokt*'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = ''
  validExitCodes= @(0)
  destination   = $toolsDir
}

# Download the vokt binary
Get-ChocolateyWebFile @packageArgs

# Rename the downloaded file to vokt.exe
$exePath = Join-Path $toolsDir "vokt-windows-amd64.exe"
$targetPath = Join-Path $toolsDir "vokt.exe"

if (Test-Path $exePath) {
    Move-Item $exePath $targetPath -Force
}

# Download Java engine JARs (platform-independent, needed for Java/JVM analysis)
$jarPath = Join-Path $toolsDir "vokt-java-engine.jar"
$taiePath = Join-Path $toolsDir "tai-e-all.jar"

Write-Host "Downloading Java engine JARs..."
Invoke-WebRequest -Uri $jarUrl -OutFile $jarPath -UseBasicParsing
Invoke-WebRequest -Uri $taieUrl -OutFile $taiePath -UseBasicParsing

# Download and extract Go toolchain — vokt auto-detects it at tools\go\
# and sets GOROOT + GOTOOLCHAIN=auto for version-independent analysis.
$goZipPath = Join-Path $toolsDir "go-toolchain.zip"
$goDir = Join-Path $toolsDir "go"

Write-Host "Downloading Go toolchain..."
Invoke-WebRequest -Uri $goUrl -OutFile $goZipPath -UseBasicParsing

# Verify checksum
$actualHash = (Get-FileHash -Path $goZipPath -Algorithm SHA256).Hash.ToLower()
if ($actualHash -ne $goChecksum) {
    Remove-Item $goZipPath -Force
    throw "Go toolchain checksum mismatch: expected $goChecksum, got $actualHash"
}

Write-Host "Extracting Go toolchain..."
# Go zip extracts to a 'go' directory — extract to tools\ so it becomes tools\go\
Expand-Archive -Path $goZipPath -DestinationPath $toolsDir -Force
Remove-Item $goZipPath -Force

if (Test-Path (Join-Path $goDir "bin\go.exe")) {
    Write-Host "Go toolchain installed at $goDir"
} else {
    Write-Warning "Go toolchain extraction may have failed — go.exe not found at $goDir\bin\go.exe"
}

Write-Host "Vokt installed with Go toolchain and Java engine support"
