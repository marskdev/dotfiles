Write-Host "Installing chocolatey and some apps" -ForegroundColor Cyan
Write-Host "-----------------------------------" -ForegroundColor Cyan
# Installing chocolatey core
if (!(Get-Command -Name "choco" -ErrorAction SilentlyContinue)) {
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
  "firacode"
  # "devtoys", # Error installing in choco, unable in winget install from msstore
  # "cmder"
  )

Write-Host "`nInstalling apps" -ForegroundColor Yellow

foreach ($app in $chocoApps) {
  #check if the app is already installed
  # choco install $app -y -r

  $listApp = choco list --localonly --exact $app
  if (![String]::Join("", $listApp) -like "*$app*") {
    Write-host "Installing:" $app -ForegroundColor Yellow
    choco install $app -y
    Write-Host "$app was installed" -ForegroundColor Green
  } else {
    Write-Host "$app already installed"
  }
}

Write-Host "`n"
