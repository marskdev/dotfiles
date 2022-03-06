# Set this config in ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Moduele imports
# ===================================
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Get-ChildItemColor
Import-Module "~\Documents\WindowsPowerShell\functions.psm1" # -Verbose

# Read key handlers
# ===================================
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -BellStyle None

function .. { cd .. }
function ... { cd ..\.. }
function .... { cd ..\..\.. }
function ~ { cd $env:USERPROFILE }
function GetMyIp {curl -L tool.lu/ip}
function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}

# Setup alias
# ===================================
Set-Alias open Invoke-Item
Set-Alias glola GitLogPretty
Set-Alias myip GetMyIp
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
# Remove curl alias
If (Test-Path Alias:curl) {Remove-Item Alias:curl}

# Set theme
oh-my-posh --init --shell pwsh --config "~\AppData\Local\oh-my-posh\themes\atomic.omp.json" | Invoke-Expression

# Set-Theme SpencerTechy

