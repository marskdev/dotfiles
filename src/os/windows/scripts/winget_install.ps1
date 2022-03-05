#Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'
if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]"1.10.0.0") {
    "Installing winget Dependencies"
    Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

    $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $releases = Invoke-RestMethod -uri $releases_url
    $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

    "Installing winget from $($latestRelease.browser_download_url)"
    Add-AppxPackage -Path $latestRelease.browser_download_url
}
else {
    "winget already installed"
}

# Remove a few pre-installed UWP applications
$uwpApps = @(
  "Microsoft.549981C3F5F10_8wekyb3d8bbwe",
  "Microsoft.OneDrive");

foreach ($uwp in $uwpApps) {
  $listApp = winget list --exact -q $uwp
  if ([String]::Join("", $listApp).Contains($uwp)) {
    winget uninstall --exact --silent $uwp
    Write-Host "$uwp was removed" -ForegroundColor Green
  } else {
    Write-Host "$uwp not found" -ForegroundColor Yellow
  }
}

# Install common apps
$commonApps = @(
    "7zip.7zip",
		# "flux.flux",
		# "Opera.Opera",
		# "Figma.Figma",
		# "VideoLAN.VLC",
		# "Notion.Notion",
		# "ShareX.ShareX",
		# "NordVPN.NordVPN",
		# "Discord.Discord",
		# "Microsoft.PowerToys",
		# "PowerSoftware.PowerISO",
		"NickeManarin.ScreenToGif")

Write-Host "Installing common apps" -ForegroundColor Cyan
Write-Host "----------------------" -ForegroundColor Cyan

foreach ($app in $commonApps) {
  #check if the app is already installed
  $listApp = winget list --exact -q $app
  if (![String]::Join("", $listApp).Contains($app)) {
    Write-host "Installing:" $app -ForegroundColor Yellow
    # winget install --exact --silent $app
    Write-Host "$app was installed" -ForegroundColor Green
  } else {
    Write-Host "$app already installed" -ForegroundColor Yellow
  }
}

$devApps = @(
		# "PuTTY.PuTTY",
		# "Postman.Postman",
		# "Canonical.Ubuntu",
		# "Lexikos.AutoHotkey",
		"Microsoft.WindowsTerminal",
		# "TimKosse.FileZilla.Client",
		"Microsoft.VisualStudioCode",
		# "AnyDeskSoftwareGmbH.AnyDesk"
    )

Write-Host "Installing development apps" -ForegroundColor Cyan
Write-Host "---------------------------" -ForegroundColor Cyan

foreach ($app in $devApps) {
  #check if the app is already installed
  $listApp = winget list --exact -q $app
  if (![String]::Join("", $listApp).Contains($app)) {
    Write-host "Installing:" $app -ForegroundColor Yellow
    # winget install --exact --silent $app
    Write-Host "$app was installed" -ForegroundColor Green
  } else {
    Write-Host "$app already installed" -ForegroundColor Yellow
  }
}
