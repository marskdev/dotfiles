# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

.\scripts\functions.ps1
.\scripts\remove-pre-installed.ps1
.\scripts\winget_install.ps1
.\scripts\choco_install.ps1
.\scripts\customize-ps.ps1
