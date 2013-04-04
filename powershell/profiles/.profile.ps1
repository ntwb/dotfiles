##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
##############################################################################################

# Start Loading message
Write-Host -ForegroundColor Green "--> Begin all the things..."

# Setup local envionment paths
$env:PSModulePath = $env:PSModulePath + ";C:\Users\Stephen\.dotfiles\powershell\modules\"
$env:Path         = $env:Path         + ";C:\Users\Stephen\.dotfiles\powershell\profiles"
Write-Host -ForegroundColor White "--> PowerShell profiles & modules... Done."

# Setup Sublime Text 2 alias & path
Set-Alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"
Write-Host -ForegroundColor White "--> Sublime Text 2 'subl' alias... Done."

# GitHub for Windows https://windows.github.com/
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
Write-Host -ForegroundColor White "--> GitHub... Done."

# NodeJS x64 for Windows http://nodejs.org/
$env:Path = $env:Path + ";C:\Program Files\nodejs"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Roaming\npm"
Write-Host -ForegroundColor White "--> NodeJS... Done."

# Ruby for Windows https://github.com/oneclick/rubyinstaller
$env:Path = $env:Path + ";C:\Ruby193\bin"
Write-Host -ForegroundColor White "--> Ruby... Done."
;

# PHP for Windows http://php.net/
$env:Path = $env:Path + ";C:\PHP"
Write-Host -ForegroundColor White "--> PHP... Done."

# Python for Windows 2.7.3 http://www.python.org/download/
$env:Path = $env:Path + ";C:\Python27"
# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
$env:PATHEXT += ";.py"
Write-Host -ForegroundColor White "--> Python... Done."

# Load posh-git example profile
. 'H:\dev\_git\posh-git\profile.example.ps1'
Write-Host -ForegroundColor White "--> PoSh-Git... Done."

# Load PowerTab
Import-Module PowerTab -ArgumentList "C:\Users\Stephen\.dotfiles\powershell\modules\PowerTab\PowerTabConfig.xml"
Write-Host -ForegroundColor White "--> PowerTab... Done."

# Load PowerShell Community Extension 3.0 Module
Import-Module Pscx
Write-Host -ForegroundColor White "--> Pscx... Done."

# Load PsGet Module https://github.com/psget/psget/
Import-Module PsGet
Write-Host -ForegroundColor White "--> PsGet... Done."

# Load posh-npm profile https://github.com/MSOpenTech/posh-npm
. 'C:\Users\Stephen\.dotfiles\powershell\modules\posh-npm\profile.example.ps1'
Write-Host -ForegroundColor White "--> posh-npm... Done."

# Finish loading message
Write-Host -ForegroundColor Green "--> Finish all the things..."
