$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = '$DOWNLOAD_URL$'
$checksum64 = '$CHECKSUM$'

$packageArgs = @{
  packageName   = 'specflow-cli'
  fileType      = 'exe'
  url64bit      = $url64
  softwareName  = 'specflow*'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = ''
  validExitCodes= @(0)
  destination   = $toolsDir
}

# Download the file
Get-ChocolateyWebFile @packageArgs

# Rename the downloaded file to specflow.exe
$exePath = Join-Path $toolsDir "specflow-windows-amd64.exe"
$targetPath = Join-Path $toolsDir "specflow.exe"

if (Test-Path $exePath) {
    Move-Item $exePath $targetPath -Force
}
