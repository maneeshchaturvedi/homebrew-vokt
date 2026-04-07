$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = '$DOWNLOAD_URL$'
$jarUrl = '$JAR_URL$'
$taieUrl = '$TAIE_URL$'
$checksum64 = '$CHECKSUM$'

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

Write-Host "Vokt installed with Java engine support"
