# -----------------------------------------------------------------------------
# Remove a few pre-installed UWP applications
# To list all appx packages:
# PS> Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName
Write-Host "Removing UWP pre-installed apps..." -ForegroundColor Green
Write-Host "----------------------------------" -ForegroundColor Green
$uwpApps = @(
  "4DF9E0F8.Netflix",
  "Microsoft.People",
  "Microsoft.Print3D",
  "Microsoft.MSPaint",
  "Fitbit.FitbitCoach",
  "Microsoft.BingNews",
  "Microsoft.SkypeApp",
  "HolographicFirstRun",
  "Microsoft.3DBuilder",
  "Microsoft.YourPhone",
  "Microsoft.Getstarted",
  "Microsoft.OneConnect",
  "Microsoft.BingWeather",
  "Microsoft.WindowsMaps",
  "Microsoft.Office.OneNote",
  "king.com.CandyCrushFriends",
  "Microsoft.Microsoft3DViewer",
  "Microsoft.WindowsFeedbackHub",
  "Microsoft.MicrosoftOfficeHub",
  "Microsoft.MixedReality.Portal",
  "Microsoft.MicrosoftSolitaireCollection")

foreach ($uwp in $uwpApps) {
  if (Get-AppxPackage -Name $uwp) {
    Get-AppxPackage -Name $uwp | Remove-AppxPackage
    Write-Host "$uwp was removed" -ForegroundColor Green
  } else {
    Write-Host "$uwp not found" -ForegroundColor Yellow
  }
}
