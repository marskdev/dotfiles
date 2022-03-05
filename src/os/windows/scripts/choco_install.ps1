# Installing chocolatey core
if (!Get-Command -Name "choco") {
  Write-Host "Installing Chocolatey" -ForegroundColor Cyan
  Write-Host "---------------------" -ForegroundColor Cyan
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
  Write-Host "Choco is already installed, skip installation."
}

# Install apps with chocolatey
$chocoApps = @(
  # "paint.net",
  # "autoruns",
  "firacode",
  # "devtoys", # Error installing in choco, unable in winget install from msstore
  # "cmder"
  )

Write-Host "Installing apps with choco" -ForegroundColor Cyan
Write-Host "--------------------------" -ForegroundColor Cyan

foreach ($app in $chocoApps) {
  #check if the app is already installed
  choco install $app -y
}
