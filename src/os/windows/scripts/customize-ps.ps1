# Install modules and change Set-ExecutionPolicy to "Unrestricted"
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -AllowClobber Get-ChildItemColor
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

cat ..\..\config\powershell\Microsoft.PowerShell_profile.ps1 > ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
