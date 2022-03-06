# Install modules and change Set-ExecutionPolicy to "Unrestricted"
Write-Host "Installing powershell modules" -ForegroundColor Cyan
Write-Host "-----------------------------" -ForegroundColor Cyan
Install-PackageProvider -Name NuGet -Force > $mock
Install-Module -AllowClobber Get-ChildItemColor -Force
Install-Module -Name PSReadLine -Scope CurrentUser -Force

$modules = @(
		"posh-git",
		"oh-my-posh"
    )


foreach ($module in $modules) {
  #check if the module is already installed
	if (!(Get-Module -ListAvailable -Name $module)) {
		Write-Host "Installing $module module" -ForegroundColor Yellow
		Install-Module -Name $module -Scope CurrentUser -Force
		Write-Host "$module module was installed" -ForegroundColor Green
	}
	else {
		Write-Host "$module module already exists"
	}
}

Write-Host "`n"
