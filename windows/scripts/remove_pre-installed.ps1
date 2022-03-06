# -----------------------------------------------------------------------------
# Remove a few pre-installed UWP applications
# To list all appx packages:
# PS> Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName
Write-Host "Removing UWP pre-installed apps" -ForegroundColor Cyan
Write-Host "-------------------------------" -ForegroundColor Cyan
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

$uwpFoundCount = 0
foreach ($uwp in $uwpApps) {
  if (Get-AppxPackage -Name $uwp) {
    $uwpFoundCount++
  }
}

  if ($uwpFoundCount -ne 0) {
    Write-Host "Found $uwpFoundCount pre-installed apps"
    foreach ($uwp in $uwpApps) {
      if (Get-AppxPackage -Name $uwp) {
        Get-AppxPackage -Name $uwp | Remove-AppxPackage
        Write-Host "$uwp was removed" -ForegroundColor Green
      }
    }
  } else {
    Write-Host "No pre-installed apps found"
  }

Write-Host "`n"
