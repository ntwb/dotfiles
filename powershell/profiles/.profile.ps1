##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 
##############################################################################################

Write-Host -ForegroundColor Green "--> Setting up enviroment variables..."

# GitHub for Windows https://windows.github.com/
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")

# NodeJS x64 for Windows http://nodejs.org/
$env:Path = $env:Path + ";C:\Program Files\nodejs"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Roaming\npm"

# PHP for Windows http://php.net/
$env:Path = $env:Path + ";C:\PHP"

# Python for Windows 2.7.3 http://www.python.org/download/
$env:Path = $env:Path + ";C:\Python27"
# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
$env:PATHEXT += ";.py"

# Load posh-git example profile
. 'H:\dev\_git\posh-git\profile.example.ps1'
