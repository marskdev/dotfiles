# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Write-Host "`n"
# Remove pre-installed apps
Get-item .\scripts\remove_pre-installed.ps1 | Unblock-File
.\scripts\remove_pre-installed.ps1

# Install winget (package manager) and some apps
Get-item .\scripts\winget_install.ps1 | Unblock-File
.\scripts\winget_install.ps1

# Install choco (package manager) and some apps
Get-item .\scripts\choco_install.ps1 | Unblock-File
.\scripts\choco_install.ps1

# Install powershell Modules
Get-item .\scripts\ps_modules_install.ps1 | Unblock-File
.\scripts\ps_modules_install.ps1

# Setting apps config
Get-item .\scripts\setting_apps.ps1 | Unblock-File
.\scripts\setting_apps.ps1

pause
